-- AlterTable
ALTER TABLE "museumOwner" ALTER COLUMN "firstName" DROP NOT NULL,
ALTER COLUMN "lastName" DROP NOT NULL,
ALTER COLUMN "email" DROP NOT NULL,
ALTER COLUMN "mobileNum" DROP NOT NULL,
ALTER COLUMN "password" DROP NOT NULL;