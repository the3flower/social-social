import React, { useState } from 'react';
import { createComment } from '../../services/api';

const CommentForm = ({ postId, onCommentCreated }) => {
    const [content, setContent] = useState('');

    const handleSubmit = async (e) => {
        e.preventDefault();
        if (!content.trim()) return;

        try {
            const newComment = await createComment(postId, content);
            onCommentCreated(postId, newComment);
            setContent('');
        } catch (error) {
            console.error('Failed to create comment', error);
        }
    };

    return (
        <form onSubmit={handleSubmit} className="comment-form">
            <input
                type="text"
                value={content}
                onChange={(e) => setContent(e.target.value)}
                placeholder="Write a comment..."
                className="comment-input"
            />
            <button type="submit" className="comment-button">Comment</button>
        </form>
    );
};

export default CommentForm;
