class Comment < ApplicationRecord

    belongs_to :user
    belongs_to :post

    validates :body, length: {minimum: 2}

    # Top 10 most popular posts
    scope :popular, -> { select('post_id, count(post_id) as count').group(:post_id).order('count desc').limit(10) }

    
    # via SQL Query
    # SELECT post_id, count(post_id) as count FROM "comments" GROUP BY post_id ORDER BY count desc LIMIT 10


    # via Console
    # comments = Comment.all
    # postids = comments.map{|comment| comment.post_id}
    # most_popular_post = postids.max_by{|id| postids.count(id)}

    # ID: 2


end
