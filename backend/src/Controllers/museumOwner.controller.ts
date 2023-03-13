import { Request, Response } from "express";
import { PrismaClient } from "@prisma/client";
import jwt from "jsonwebtoken";

const prisma = new PrismaClient();

export const register = async (req: Request, res: Response) => {
  const { firstName, lastName, email, password, mobileNum } = req.body;

  try {
    let errors: any = {};

    //validate
    const userData = await prisma.museumOwner.findFirst({
      where: {
        email,
        mobileNum,
      },
    });
    if (userData) errors.userData = "This user already exists!!";

    if (Object.keys(errors).length > 0) {
      return res.status(400).json(errors);
    }

    //create museum owner
    const museumOwnerData = await prisma.museumOwner.create({
      data: {
        firstName,
        lastName,
        email,
        mobileNum,
        password,
      },
    });

    return res.json(museumOwnerData);
  } catch (error) {
    console.log(error);
    res.status(500).json({ message: "Internal Server Error" });
  }
};

export const login = async (req: Request, res: Response) => {
  const { email, password } = req.body;

  try {
    const userData = await prisma.museumOwner.findFirst({
      where: {
        email,
        password
      },
    });

    if (!userData)
      return res
        .status(404)
        .json({ username: "Worng username and password combination !!" });

    //gen JWT 
    const token = jwt.sign({ email }, process.env.JWT_SECRET!);

    return res.json({"userData": userData, "token": token})
  } catch (error) {
    console.log(error);
    res.status(500).json({ message: "Internal Server Error" });
  }
};
