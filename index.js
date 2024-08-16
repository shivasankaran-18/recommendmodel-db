import fs from 'fs';
import csv from 'csv-parser';
import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

async function insertData() {
  const data = [];


  fs.createReadStream('./alumni_profiles_final.csv') 
    .pipe(csv()) 
    .on('data', (row) => {
        console.log('Parsed row:', row);  
      data.push({
        alumName: row.name,
        sector: row.sector,
        skills: row.skills.split(';'), 
        interests: row.interests.split(';'),
        current_industry: row.current_industry,
      });
    })
    .on('end', async () => {  
      console.log('CSV file successfully processed');

      try {
   
        const result = await prisma.alumni.createMany({
          data,
      
        });

        console.log(`${result.count} records inserted successfully`);
      } catch (error) {
        console.error('Error inserting data:', error);
      } finally {
        await prisma.$disconnect(); 
      }
    });
}

insertData().catch((error) => {
  console.error('Unexpected error:', error);
  prisma.$disconnect();
  process.exit(1);
});

// async function temp(){

//     await prisma.student.deleteMany({})
// }
// temp()
