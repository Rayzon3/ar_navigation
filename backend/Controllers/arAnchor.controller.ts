import { Request, Response } from "express";
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export const uploadARAnchors = async (req: Request, res: Response) => {
  const { arAnchorList } = req.body;

  const ARData = JSON.stringify(arAnchorList)

  try {
    const anchorData = await prisma.museum.create({
      data: {
        ARAnchorList: ARData,
      },
    });

    return res.json(anchorData)
  } catch (err) {
    console.log(err);
    res.status(500).json({ message: "Internal Server Error" });
  }
};


export const getARAnchors = async (_: Request, res: Response) => {
  try{
    const ARAnchorList = await prisma.museum.findMany();
    
    const ARData = JSON.parse(ARAnchorList[0].ARAnchorList[0])

    return res.json(ARData)
  }catch (err) {
    console.log(err);
    res.status(500).json({ message: "Internal Server Error" });
  }
}
