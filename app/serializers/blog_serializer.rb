class BlogSerializer < ActiveModel::Serializer
	attributes :id, :content, :title

	has_many :comments, serializer: CommentSerializer
end