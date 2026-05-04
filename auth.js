function checkAuth() {
    const token = localStorage.getItem("token");
    if (!token) { window.location.href = "index.html"; return false; }
    return true;
}

function getCurrentUser() {
    return { username: localStorage.getItem("username"), token: localStorage.getItem("token") };
}

function logout() {
    localStorage.clear();
    window.location.href = "index.html";
}

async function authenticatedFetch(url, options = {}) {
    const token = localStorage.getItem("token");
    const headers = { "Authorization": `Bearer ${token}`, "Content-Type": "application/json" };
    const response = await fetch(url, { ...options, headers: { ...headers, ...options.headers } });
    if (response.status === 401) logout();
    return response;
}
