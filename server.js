const express = require('express');
const jwt = require('jsonwebtoken');
const cors = require('cors');
const path = require('path');

const app = express();
const SECRET = 'STEALTH_TIGER_99';

app.use(cors());
app.use(express.json());
app.use(express.static(path.join(__dirname, '../frontend')));

app.post('/auth/login', (req, res) => {
    const { user, pass } = req.body;
    if (user === 'admin' && pass === 'admin123') {
        const token = jwt.sign({ id: 1, role: 'root' }, SECRET, { expiresIn: '2h' });
        return res.json({ status: 'granted', token });
    }
    res.status(403).json({ status: 'denied' });
});

app.listen(3000, () => console.log('>>> NOVADEV STEALTH CORE: ACTIVE ON PORT 3000'));
