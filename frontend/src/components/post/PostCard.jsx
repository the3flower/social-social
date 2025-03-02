import React from 'react';
import CommentList from './CommentList';
import CommentForm from './CommentForm';

const PostCard = ({ post, onCommentCreated }) => {
    return (
        <div className="post-card">
            <h3>{post.user.name}</h3>
            <p>{post.content}</p>
            <CommentList comments={post.comments || []} />
            <CommentForm postId={post.id} onCommentCreated={onCommentCreated} />
        </div>
    );
};

export default PostCard;
