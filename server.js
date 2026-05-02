const express = require('express');
const jwt = require('jsonwebtoken');
const bodyParser = require('body-parser');
const cors = require('cors');
const path = require('path');

const app = express();
const PORT = 3000;
const SECRET_KEY = 'TIGER_CORE_SECRET_2026';

app.use(cors());
app.use(bodyParser.json());
app.use(express.static(path.join(__dirname, '../frontend')));

// 🔐 Authentication Route
app.post('/api/login', (req, res) => {
    const { username, password } = req.body;
    
    // بيانات افتراضية للدخول
    if (username === 'admin' && password === 'admin123') {
        const token = jwt.sign({ username, role: 'admin' }, SECRET_KEY, { expiresIn: '1h' });
        return res.json({ success: true, token, user: { username, role: 'admin' } });
    }
    
    res.status(401).json({ success: false, message: 'Invalid credentials' });
});

// 🛡 Middleware to protect routes
const authenticateToken = (req, res, next) => {
    const authHeader = req.headers['authorization'];
    const token = authHeader && authHeader.split(' ')[1];

    if (!token) return res.sendStatus(401);

    jwt.verify(token, SECRET_KEY, (err, user) => {
        if (err) return res.sendStatus(403);
        req.user = user;
        next();
    });
};

// 📊 Protected Data Route
app.get('/api/dashboard-stats', authenticateToken, (req, res) => {
    res.json({
        activeProjects: 12,
        serverStatus: 'Online',
        lastLogin: new Date().toLocaleString()
    });
});

app.listen(PORT, () => {
    console.log(`🚀 NOVADEV Enterprise Server running on http://localhost:${PORT}`);
});