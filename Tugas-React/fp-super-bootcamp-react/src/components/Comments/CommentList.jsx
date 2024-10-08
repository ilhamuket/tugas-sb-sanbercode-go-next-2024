import { useEffect } from 'react';
import PropTypes from 'prop-types';
import { useComments } from '../../context/CommentsContext';
import { FaUser } from 'react-icons/fa'; // Menggunakan ikon pengguna dari react-icons

const CommentList = ({ newsId }) => {
  const { commentsByNewsId, fetchComments, deleteComment, loading, error } = useComments();

  useEffect(() => {
    fetchComments(newsId);
  }, [newsId, fetchComments]);

  // Get comments for the current newsId
  const comments = commentsByNewsId[newsId] || [];

  if (loading) return <p className="text-center">Loading comments...</p>;
  if (error) return <p className="text-center text-red-500">Error: {error.message}</p>;

  return (
    <div className="space-y-4">
      <h3 className="text-xl font-semibold mb-4">Comments</h3>
      {comments.length > 0 ? (
        comments.map((comment) => (
          <div key={comment.id} className="p-4 bg-base-200 rounded-lg shadow-md flex items-start">
            <div className="flex-shrink-0 mr-4">
              <FaUser className="text-gray-500" size={24} /> {/* Ikon pengguna */}
            </div>
            <div className="flex-1">
              <div className="flex items-center mb-2">
                <span className="font-semibold mr-2">{comment.user.username}</span>
              </div>
              <p className="mb-2">{comment.text}</p>
            </div>
            <button
              onClick={() => deleteComment(comment.id)}
              className="btn btn-error btn-sm"
            >
              Delete
            </button>
          </div>
        ))
      ) : (
        <p>No comments yet</p>
      )}
    </div>
  );
};

// PropTypes validation
CommentList.propTypes = {
  newsId: PropTypes.number.isRequired,
};

export default CommentList;
