/*
  Warnings:

  - You are about to drop the column `studName` on the `Alumni` table. All the data in the column will be lost.
  - Added the required column `alumName` to the `Alumni` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Alumni" DROP COLUMN "studName",
ADD COLUMN     "alumName" TEXT NOT NULL;
