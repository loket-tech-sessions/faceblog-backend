class CommentSerializer < ActiveModel::Serializer
	attributes :id, :content, :test

	def test
		DateTime.now.strftime('%H:%M')
	end
end