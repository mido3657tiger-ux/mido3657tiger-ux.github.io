// =============================================
// NOVADEV Authentication Module
// =============================================

// Check if user is authenticated
function checkAuth() {
    const token = localStorage.getItem("token");

    if (!token) {
        window.location.href = "index.html";
        return false;
    }

    return true;
}

// Get current user info
function getCurrentUser() {
    const username = localStorage.getItem("username");
    const token = localStorage.getItem("token");

    if (!username || !token) {
        return null;
    }

    return {
        username: username,
        token: token
    };
}

// Logout function
function logout() {
    localStorage.removeItem("token");
    localStorage.removeItem("username");
    localStorage.removeItem("rememberMe");
    window.location.href = "index.html";
}

// Store user session
function storeSession(username, token) {
    localStorage.setItem("username", username);
    localStorage.setItem("token", token);
}

// Clear session
function clearSession() {
    localStorage.removeItem("token");
    localStorage.removeItem("username");
}

// Validate token
async function validateToken(token) {
    try {
        const response = await fetch("http://127.0.0.1:3000/user/profile", {
            method: "GET",
            headers: {
                "Authorization": `Bearer ${token}`,
                "Content-Type": "application/json"
            }
        });

        return response.ok;
    } catch (error) {
        console.error("Token validation failed:", error);
        return false;
    }
}

// Get auth headers
function getAuthHeaders() {
    const token = localStorage.getItem("token");

    return {
        "Authorization": `Bearer ${token}`,
        "Content-Type": "application/json"
    };
}

// Authenticated fetch
async function authenticatedFetch(url, options = {}) {
    const headers = getAuthHeaders();

    try {
        const response = await fetch(url, {
            ...options,
            headers: {
                ...headers,
                ...options.headers
            }
        });

        if (response.status === 401) {
            clearSession();
            window.location.href = "index.html";
            throw new Error("Session expired");
        }

        return response;
    } catch (error) {
        console.error("Authenticated fetch failed:", error);
        throw error;
    }
}

// Export (Node support)
if (typeof module !== "undefined" && module.exports) {
    module.exports = {
        checkAuth,
        getCurrentUser,
        logout,
        storeSession,
        clearSession,
        validateToken,
        getAuthHeaders,
        authenticatedFetch
    };
}