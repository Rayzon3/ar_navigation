import express from "express";
import dotenv from "dotenv";
import morgan from "morgan";

dotenv.config();

const app = express();
const PORT = process.env.PORT;

app.use(morgan("dev"));
app.use(express.json());

app.get("/", (_, res) => res.send("Hello World! \n"));
app.listen(PORT, async () => {
  try {
    console.log(`Server running at PORT:${PORT} 🚀`);
    console.log("Database Connected !!");
  } catch (err) {
    console.log(err);
  }
});
