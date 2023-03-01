import { Request, Response } from "express";
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export const addARAnchors = async (req: Request, res: Response) => {
  const { arAnchorList } = req.body;

  try {
    const anchorData = await prisma.aRAnchorMatrix.create({
      data: {
        ARAnchorList: arAnchorList,
      },
    });

    return res.json(anchorData)
  } catch (err) {
    console.log(err);
    res.status(500).json({ message: "Internal Server Error" });
  }
};
