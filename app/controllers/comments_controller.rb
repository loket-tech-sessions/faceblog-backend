class CommentsController < ApplicationController

	def index
		@comments = Comment.where(:blog_id => params[:blog_id])
		render_response(@comments)
	end

	def create
		@comment = Comment.create!(comment_params)
		render_response(@comment)
	end

	private

	def comment_params
		params.permit(:content, :blog_id)
	end

end
