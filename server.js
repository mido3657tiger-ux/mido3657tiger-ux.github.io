const express = require("express");
const cors = require("cors");
const jwt = require("jsonwebtoken");

const app = express();
app.use(cors());
app.use(express.json());

const SECRET_KEY = "novadev-project-secret-key-2024";

// Dummy users
const users = {
    admin: {
        username: "admin",
        password: "admin123",
        role: "admin",
        email: "admin@novadev.com"
    },
    user: {
        username: "user",
        password: "123456",
        role: "user",
        email: "user@novadev.com"
    }
};

// Middleware
const verifyToken = (req, res, next) => {
    const authHeader = req.headers["authorization"];

    if (!authHeader) {
        return res.status(403).json({
            success: false,
            message: "No token provided"
        });
    }

    try {
        const token = authHeader.split(" ")[1];
        const decoded = jwt.verify(token, SECRET_KEY);
        req.user = decoded;
        next();
    } catch (error) {
        return res.status(401).json({
            success: false,
            message: "Invalid token"
        });
    }
};

// Login
app.post("/login", (req, res) => {
    const { username, password } = req.body;

    if (!username || !password) {
        return res.status(400).json({
            success: false,
            message: "Username and password required"
        });
    }

    const user = users[username];

    if (!user || user.password !== password) {
        return res.status(401).json({
            success: false,
            message: "Invalid credentials"
        });
    }

    const token = jwt.sign(
        {
            userId: username,
            username: user.username,
            email: user.email,
            role: user.role
        },
        SECRET_KEY,
        { expiresIn: "1h" }
    );

    res.json({
        success: true,
        message: "Login successful",
        token,
        user: {
            username: user.username,
            email: user.email,
            role: user.role
        }
    });
});

// Profile
app.get("/user/profile", verifyToken, (req, res) => {
    res.json({
        success: true,
        user: req.user
    });
});

// Dashboard
app.get("/dashboard", verifyToken, (req, res) => {
    res.json({
        success: true,
        data: {
            activeProjects: 12,
            tasksCompleted: 56,
            teamMembers: 8
        }
    });
});

// Projects
app.get("/projects", verifyToken, (req, res) => {
    res.json({
        success: true,
        projects: [
            {
                id: 1,
                title: "Security System",
                description: "JWT Authentication",
                status: "Active"
            },
            {
                id: 2,
                title: "UI Framework",
                description: "Modern UI/UX design",
                status: "Planning"
            },
            {
                id: 3,
                title: "Mobile App",
                description: "Cross-platform application",
                status: "Testing"
            }
        ]
    });
});

// Logout
app.post("/logout", verifyToken, (req, res) => {
    res.json({
        success: true,
        message: "Logged out successfully"
    });
});

// Health check
app.get("/", (req, res) => {
    res.json({
        success: true,
        message: "Server is running",
        endpoints: [
            "/login",
            "/dashboard",
            "/projects",
            "/user/profile"
        ]
    });
});

// 404 handler
app.use((req, res) => {
    res.status(404).json({
        success: false,
        message: "Route not found"
    });
});

// Error handler
app.use((err, req, res, next) => {
    console.error(err.stack);
    res.status(500).json({
        success: false,
        message: "Internal server error"
    });
});

// Start server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`🚀 Server running on http://localhost:${PORT}`);
});