const API_URL = 'http://localhost:3000';

// Auth
export async function registerUser(name, email, password) {
    try {
        const payload = { name, email, password };
        console.log("Payload being sent:", payload);

        const response = await fetch(`${API_URL}/auth/register`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ name, email, password }),
        });

        if (!response.ok) {
            const errorData = await response.json();
            throw new Error(errorData.error || 'Registration failed');
        }

        return await response.json();
    } catch (error) {
        console.error('Error during registration:', error.message);
        throw error;
    }
}

export async function loginUser(email, password) {
    try {
        const response = await fetch(`${API_URL}/auth/login`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ email, password }),
        });

        if (!response.ok) {
            const errorData = await response.json();
            throw new Error(errorData.error || 'Login failed');
        }

        return await response.json();
    } catch (error) {
        console.error('Error during login:', error.message);
        throw error;
    }
}

export function logoutUser() {
    localStorage.removeItem('token');
}

// Posts and Comments
export async function fetchPosts() {
    const response = await fetch(`${API_URL}/posts`);
    return await response.json();
}

export async function createPost(content) {
    const response = await fetch(`${API_URL}/posts`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            'Authorization': `Bearer ${localStorage.getItem('token')}`,
        },
        body: JSON.stringify({ post: { content } }),
    });
    return await response.json();
}

export async function createComment(postId, content) {
    const response = await fetch(`${API_URL}/posts/${postId}/comments`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            'Authorization': `Bearer ${localStorage.getItem('token')}`,
        },
        body: JSON.stringify({ comment: { content } }),
    });
    return await response.json();
}