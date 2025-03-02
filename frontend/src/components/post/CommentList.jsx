import React from 'react';

const CommentList = ({ comments }) => {
    return (
        <div className="comment-list">
            {comments.map((comment) => (
                <div key={comment.id} className="comment">
                    <p><strong>{comment.user.name}:</strong> {comment.content}</p>
                </div>
            ))}
        </div>
    );
};

export default CommentList;
