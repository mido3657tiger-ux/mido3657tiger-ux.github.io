function login(){
let user = document.getElementById("user").value;
let pass = document.getElementById("pass").value;

if(user === "admin" && pass === "1234"){
alert("Login Success");
window.location="dashboard.html";
}else{
alert("Wrong Data");
}
}