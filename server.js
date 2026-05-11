const express = require("express");
const path = require("path");
const helmet = require("helmet");
const morgan = require("morgan");

const app = express();

/* =========================
   CONFIG
========================= */
const PORT = process.env.PORT || 3000;

/* =========================
   SECURITY + LOGGING
========================= */
app.use(helmet());
app.use(morgan("dev"));

/* =========================
   STATIC FILES
========================= */
app.use(express.static(__dirname));

/* =========================
   ROUTES
========================= */

app.get("/", (req, res) => {
    res.sendFile(path.join(__dirname, "index.html"));
});

app.get("/dashboard", (req, res) => {
    res.sendFile(path.join(__dirname, "dashboard.html"));
});

app.get("/projects", (req, res) => {
    res.sendFile(path.join(__dirname, "projects.html"));
});

app.get("/report", (req, res) => {
    res.sendFile(path.join(__dirname, "report.html"));
});

/* =========================
   API / HEALTH CHECK
========================= */
app.get("/health", (req, res) => {
    res.json({
        status: "ONLINE",
        system: "TIGERX CORE",
        version: "1.0.0",
        uptime: process.uptime(),
        timestamp: new Date().toISOString()
    });
});

/* =========================
   404 HANDLER
========================= */
app.use((req, res) => {
    res.status(404).sendFile(path.join(__dirname, "index.html"));
});

/* =========================
   START SERVER
========================= */
app.listen(PORT, () => {
    console.log("=====================================");
    console.log("🚀 TIGERX SYSTEM STARTED");
    console.log("🌐 URL: http://localhost:" + PORT);
    console.log("🔥 STATUS: ONLINE");
    console.log("=====================================");
});
