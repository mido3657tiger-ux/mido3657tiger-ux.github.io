// ==========================================
// NOVADEV Authentication Module
// ==========================================

/**
 * Check if user is authenticated
 * Returns true if token exists, otherwise redirects to login
 */
function checkAuth() {
    const token = localStorage.getItem("token");

    if (!token) {
        window.location.href = "index.html";
        return false;
    }

    return true;
}

/**
 * Get current user info from local storage
 */
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

/**
 * Logout function: Clear session and redirect
 */
function logout() {
    localStorage.removeItem("token");
    localStorage.removeItem("username");
    localStorage.removeItem("rememberMe");
    window.location.href = "index.html";
}

/**
 * Store user session after successful login
 */
function storeSession(username, token) {
    localStorage.setItem("username", username);
    localStorage.setItem("token", token);
}

/**
 * Clear session data
 */
function clearSession() {
    localStorage.removeItem("token");
    localStorage.removeItem("username");
}

/**
 * Check token validity (optional)
 * Calls backend to verify if the token is still active
 */
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

/**
 * Get auth headers for API calls
 */
function getAuthHeaders() {
    const token = localStorage.getItem("token");

    return {
        "Authorization": `Bearer ${token}`,
        "Content-Type": "application/json"
    };
}

/**
 * Make authenticated API call with automatic error handling
 */
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

// Export functions for use in other modules if using Node.js environment
if (typeof module !== 'undefined' && module.exports) {
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
