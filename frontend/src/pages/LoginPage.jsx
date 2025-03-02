import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { loginUser } from '../services/api';
import '../assets/auth.css';

const LoginPage = () => {
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [error, setError] = useState(null);
    const navigate = useNavigate();

    const handleSubmit = async (e) => {
        e.preventDefault();
        try {
            const data = await loginUser(email, password);
            localStorage.setItem('token', data.token);
            alert('Login successful!');
            navigate('/posts');
        } catch (err) {
            setError(err.message);
        }
    };

    return (
        <div className="auth-container">
            <h2>Login</h2>
            <form onSubmit={handleSubmit} className="auth-form">
                <input
                    type="email"
                    placeholder="Email"
                    value={email}
                    onChange={(e) => setEmail(e.target.value)}
                />
                <input
                    type="password"
                    placeholder="Password"
                    value={password}
                    onChange={(e) => setPassword(e.target.value)}
                />
                <button type="submit">Login</button>
                {error && <p style={{ color: 'red' }}>{error}</p>}
            </form>
            <p>
                Don't have an account?{' '}
                <button onClick={() => navigate('/register')}>
                    Go to Register
                </button>
            </p>
        </div>
    );
};

export default LoginPage;
