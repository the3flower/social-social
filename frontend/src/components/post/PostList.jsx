import React from 'react';
import PostCard from './PostCard';

const PostList = ({ posts, onCommentCreated }) => {
    return (
        <div className="post-list">
            {posts.map((post) => (
                <PostCard key={post.id} post={post} onCommentCreated={onCommentCreated} />
            ))}
        </div>
    );
};

export default PostList;
