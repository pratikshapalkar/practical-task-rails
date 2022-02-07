json.extract! comment, :id, :comment_no, :user_comment, :created_at, :updated_at
json.url comment_url(comment, format: :json)
