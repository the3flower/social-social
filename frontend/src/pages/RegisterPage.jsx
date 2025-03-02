import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { registerUser } from '../services/api';

const RegisterPage = () => {
    const [name, setName] = useState('');
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [error, setError] = useState(null);
    const navigate = useNavigate();

    const handleSubmit = async (e) => {
        e.preventDefault();
        try {
            await registerUser(name, email, password);
            alert('Registration successful! Redirecting to login page...');
            navigate('/login');
        } catch (err) {
            setError(err.message);
        }
    };

    return (
        <div className="auth-container">
            <h2>Register</h2>
            <form onSubmit={handleSubmit} className="auth-form">
                <input
                    type="text"
                    placeholder="Name"
                    value={name}
                    onChange={(e) => setName(e.target.value)}
                />
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
                <button type="submit">Register</button>
                {error && <p style={{ color: 'red' }}>{error}</p>}
            </form>
            <p>
                Already have an account?{' '}
                <button onClick={() => navigate('/login')}>
                    Go to Login
                </button>
            </p>
        </div>
    );
};

export default RegisterPage;
