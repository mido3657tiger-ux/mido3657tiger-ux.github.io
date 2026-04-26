const express = require("express");
const jwt = require("jsonwebtoken");
const cors = require("cors");

const app = express();
app.use(express.json());
app.use(cors());

const SECRET = "novadev-secret-key";

// بيانات مؤقتة (بدل database)
const USER = {
  username: "admin",
  password: "123456"
};

// 🔐 Login API
app.post("/login", (req, res) => {
  const { username, password } = req.body;

  if(username === USER.username && password === USER.password){

    const token = jwt.sign({ username }, SECRET, { expiresIn: "1h" });

    return res.json({
      success: true,
      token
    });

  }else{
    return res.status(401).json({
      success: false,
      message: "Invalid credentials"
    });
  }
});

// 🔒 Secure API
app.get("/secure", (req, res) => {
  const authHeader = req.headers.authorization;

  if(!authHeader) return res.sendStatus(403);

  const token = authHeader.split(" ")[1];

  try{
    const verified = jwt.verify(token, SECRET);
    res.json({
      message: "Welcome to secure zone 😈",
      user: verified.username
    });
  }catch{
    res.sendStatus(401);
  }
});

// تشغيل السيرفر
app.listen(3000, () => {
  console.log("🔥 Server running on http://localhost:3000");
});
