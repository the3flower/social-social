import React, { useState } from 'react';
import { createPost } from '../../services/api';

const PostForm = ({ onPostCreated }) => {
    const [content, setContent] = useState('');

    const handleSubmit = async (e) => {
        e.preventDefault();
        if (!content.trim()) return;

        try {
            const newPost = await createPost(content);
            onPostCreated(newPost);
            setContent('');
        } catch (error) {
            console.error('Failed to create post', error);
        }
    };

    return (
        <form onSubmit={handleSubmit} className="post-form">
            <textarea
                value={content}
                onChange={(e) => setContent(e.target.value)}
                placeholder="Write a post..."
                rows="3"
                className="post-input"
            />
            <button type="submit" className="post-button">Post</button>
        </form>
    );
};

export default PostForm;
