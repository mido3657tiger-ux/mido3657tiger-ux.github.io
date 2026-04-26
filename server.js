const express = require("express");
const jwt = require("jsonwebtoken");
const cors = require("cors");

const app = express();
app.use(express.json());
app.use(cors());

const SECRET = "novadev-secret-key";

// بيانات تجريبية
const USER = {
  username: "admin",
  password: "123456"
};

// 🔐 login
app.post("/login", (req, res) => {
  const { username, password } = req.body;

  if (username === USER.username && password === USER.password) {
    const token = jwt.sign({ username }, SECRET, { expiresIn: "1h" });

    return res.json({
      success: true,
      token
    });
  }

  return res.status(401).json({
    success: false,
    message: "Invalid credentials"
  });
});

// 🔒 secure
app.get("/secure", (req, res) => {
  const authHeader = req.headers.authorization;

  if (!authHeader) return res.sendStatus(403);

  const token = authHeader.split(" ")[1];

  try {
    const verified = jwt.verify(token, SECRET);

    res.json({
      message: "Welcome 😈",
      user: verified.username
    });
  } catch {
    res.sendStatus(401);
  }
});

// تشغيل
app.listen(3000, "0.0.0.0", () => {
  console.log("🔥 Server running on http://0.0.0.0:3000");
});
