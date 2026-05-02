const API_URL = 'http://localhost:3000/api';

async function handleLogin() {
    const user = document.getElementById('username').value;
    const pass = document.getElementById('password').value;
    const msg = document.getElementById('message');

    try {
        const response = await fetch(`${API_URL}/login`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ username: user, password: pass })
        });

        const data = await response.json();

        if (data.success) {
            localStorage.setItem('token', data.token);
            localStorage.setItem('user', JSON.stringify(data.user));
            msg.style.color = "#10b981";
            msg.innerText = "✅ تم التحقق.. جاري الدخول";
            setTimeout(() => { window.location.href = 'dashboard.html'; }, 1000);
        } else {
            msg.style.color = "#ef4444";
            msg.innerText = "❌ خطأ في اسم المستخدم أو كلمة المرور";
        }
    } catch (error) {
        msg.innerText = "⚠️ السيرفر غير متصل";
    }
}

function checkAuth() {
    const token = localStorage.getItem('token');
    if (!token && !window.location.href.includes('index.html')) {
        window.location.href = 'index.html';
    }
}

function logout() {
    localStorage.clear();
    window.location.href = 'index.html';
}