class BlogsController < ApplicationController
	before_action :set_blog_id, only: [:show, :update]

	def index
		@blogs = Blog.all
		serialized = serialize_resource(@blogs, BlogSerializer)
		success_response(data: serialized)
	end

	def set_blog_id
		@blog = Blog.find(params[:id])
	rescue ActiveRecord::RecordNotFound => e
		error_response(data: e)
	end

	def show
		# render_response(@blog)
		serialized = serialize_resource(@blog, BlogSerializer)
		success_response(data: serialized)
	end

	def create
		@blog = Blog.new(blog_params)
		if @blog.save
			serialized = serialize_resource(@blog, BlogSerializer)
			success_response(data: serialized)
		else
			error_response(data: @blog)
		end
	end

	def update
		@blog.update(blog_params)
		render_response(@blog)
	end

	def validate_params
		params.select { |params| params.present? }
	end

	private

	def blog_params
		params.permit(:content, :title)
	end

end
