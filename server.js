JavaScript
const express = require("express");
const app = express();

app.use(express.static(__dirname));

app.get("/", (req,res)=>{
res.sendFile(__dirname + "/index.html");
});

app.listen(3000, ()=>{
console.log("Server running on http://localhost:3000");
});
📦 package.json
JSON
{
"name": "cyber-project",
"version": "1.0.0",
"main": "server.js",
"dependencies": {
"express": "^4.18.2"
}
}
🚀 تشغيل المشروع

npm install
node server.js
🌐 تشغيل GitHub Pages
Settings → Pages
Branch: main
Done ✅
🔥 النتيجة
