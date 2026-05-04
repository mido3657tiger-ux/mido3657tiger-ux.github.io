const express = require('express');
const jwt = require('jsonwebtoken');
const cors = require('cors');
const bodyParser = require('body-parser');

const app = express();
const PORT = 3000;
const SECRET_KEY = 'mido_tiger_secret_key';

app.use(cors());
app.use(bodyParser.json());

const users = [{ id: 1, username: 'admin', password: '123456', role: 'admin', email: 'admin@novadev.com' }];

app.post('/login', (req, res) => {
    const { username, password } = req.body;
    const user = users.find(u => u.username === username && u.password === password);
    if (user) {
        const token = jwt.sign({ id: user.id, username: user.username }, SECRET_KEY, { expiresIn: '1h' });
        res.json({ success: true, token, user: { id: user.id, username: user.username, role: user.role } });
    } else {
        res.status(401).json({ success: false, message: 'Invalid credentials' });
    }
});

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

app.get('/dashboard', authenticateToken, (req, res) => {
    res.json({ success: true, data: { activeProjects: 12, codeCommits: 156, tasksCompleted: 48, teamMembers: 8 } });
});

app.listen(PORT, () => console.log(`Server running on http://localhost:${PORT}`));
