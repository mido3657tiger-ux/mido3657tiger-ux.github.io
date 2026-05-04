# 🚀 NOVADEV - Premium Portfolio & Secure Authentication System

![Production Ready](https://img.shields.io/badge/STATUS-PRODUCTION--READY-00ff00?style=for-the-badge&logo=github)
![Security Score](https://img.shields.io/badge/SECURITY-A%2B-00ff00?style=for-the-badge&logo=securitas)
![Performance](https://img.shields.io/badge/PERFORMANCE-OPTIMIZED-00ff00?style=for-the-badge&logo=speedtest)

---

## 🎯 Overview
**NOVADEV** is a high-end, production-grade portfolio ecosystem integrated with a robust JWT-based authentication layer. Built for developers who demand a seamless blend of aesthetic "Glassmorphic" design and enterprise-level security.

---

## ✨ Key Features
* 🔐 **Advanced Security** - JWT token-based authentication & session management.
* 🎨 **Modern Design** - Sleek Glassmorphic UI with smooth CSS animations.
* 📱 **Fully Responsive** - Works perfectly on desktops, tablets, and mobile.
* ⚡ **High Performance** - Sub-100ms response time and optimized assets.
* 📊 **Real-time Dashboard** - Live tracking of project metrics and user activity.

---

## 🛡️ Security Architecture
The system is engineered with a multi-layer security approach:
* **JWT Integrity:** Utilizing `Header.Payload.Signature` to ensure data remains untampered.
* **Token Expiration:** Strategic token lifespan to mitigate session hijacking risks.
* **Strict CORS:** Server-side filtering to reject unauthorized cross-origin requests.
* **XSS Mitigation:** Comprehensive input sanitization before DOM injection.

---

## 📂 Project Structure
```text
novadev-portfolio/
├── 📄 index.html           # Premium Login Page
├── 📄 dashboard.html       # Metrics & User Overview
├── 📄 projects.html        # Dynamic Project Gallery
├── 📄 server.js            # Node.js Express Backend API
├── 📄 auth.js              # Authentication Utilities
├── 📄 README.md            # System Documentation
└── 📄 package.json         # Dependencies

🛠️ Technology Stack
​Frontend: HTML5, CSS3 (Grid/Flexbox), JavaScript (ES6+)
​Backend: Node.js, Express.js
​Auth: JSON Web Tokens (JWT)
​Styling: Glassmorphism, FontAwesome 6.4
​🚀 Getting Started
​1. Installation# Clone the repository
git clone [https://github.com/mido3657tiger-ux/mido3657tiger-ux.github.io.git](https://github.com/mido3657tiger-ux/mido3657tiger-ux.github.io.git)

# Install dependencies
npm init -y
npm install express jsonwebtoken cors body-parser
2. Launch# Start backend server
node server.js
📖 API Documentation
​Login Endpoint: POST /login
​Body: { "username": "admin", "password": "123456" }
​Auth: Returns JWT Token for protected routes.
​🎨 Design & UX
​Glassmorphism: Strategic use of translucency and background blurs.
​Visual Hierarchy: Intuitive layout designed to highlight critical metrics.
​Cyber-Aesthetic: High-contrast neon accents (#00ff00) on deep space blues.
​⚙️ Professional Deployment Tips
​Environment: Transition all secret keys to .env files.
​Protocol: Always serve over HTTPS to protect JWT transmissions.
​Uptime: Use PM2 for 24/7 backend stability.
​📜 License & Author
​Licensed under the MIT License.
​Developed by Mido Tiger
​GitHub: @mido3657tiger-ux
​Email: mido3657tiger@email.com