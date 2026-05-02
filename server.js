const express = require('express');
const jwt = require('jsonwebtoken');
const path = require('path');
const app = express();

const CONFIG = { PORT: 3000, KEY: 'TIGER_CORE_XP' };

app.use(express.json());
app.use(express.static(path.join(__dirname, '../frontend')));

app.post('/api/auth', (req, res) => {
    const { u, p } = req.body;
    if (u === 'admin' && p === 'admin123') {
        const token = jwt.sign({ access: 'root' }, CONFIG.KEY);
        return res.json({ status: 200, token });
    }
    res.json({ status: 403 });
});

app.listen(CONFIG.PORT, () => console.log(`[SYSTEM] CORE ACTIVE: ${CONFIG.PORT}`));
