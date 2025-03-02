import React, { useEffect, useState } from 'react';
import { fetchPosts } from '../services/api';
import PostForm from '../components/post/PostForm';
import PostList from '../components/post/PostList';
import LogoutButton from '../components/auth/LogoutButton';

const PostPage = () => {
    const [posts, setPosts] = useState([]);

    useEffect(() => {
        const loadPosts = async () => {
            try {
                const data = await fetchPosts();
                setPosts(data);
            } catch (error) {
                console.error('Failed to load posts', error);
            }
        };
        loadPosts();
    }, []);

    const handlePostCreated = (newPost) => {
        setPosts((prevPosts) => [newPost, ...prevPosts]);
    };

    const handleCommentCreated = (postId, newComment) => {
        setPosts((prevPosts) => prevPosts.map(post => 
            post.id === postId ? { ...post, comments: [...post.comments, newComment] } : post
        ));
    };

    return (
        <div className="post-page">
            <h1>Posts</h1>
            <LogoutButton />
            <PostForm onPostCreated={handlePostCreated} />
            <PostList posts={posts} onCommentCreated={handleCommentCreated} />
        </div>
    );
};

export default PostPage;
