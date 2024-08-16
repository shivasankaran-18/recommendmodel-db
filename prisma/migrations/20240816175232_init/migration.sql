-- CreateTable
CREATE TABLE "Student" (
    "profile_id" SERIAL NOT NULL,
    "studName" TEXT NOT NULL,
    "sector" TEXT NOT NULL,
    "skills" TEXT[],
    "interests" TEXT[],
    "interested_industry" TEXT NOT NULL,

    CONSTRAINT "Student_pkey" PRIMARY KEY ("profile_id")
);

-- CreateTable
CREATE TABLE "Alumni" (
    "profile_id" SERIAL NOT NULL,
    "studName" TEXT NOT NULL,
    "sector" TEXT NOT NULL,
    "skills" TEXT[],
    "interests" TEXT[],
    "current_industry" TEXT NOT NULL,

    CONSTRAINT "Alumni_pkey" PRIMARY KEY ("profile_id")
);
