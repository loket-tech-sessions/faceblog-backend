module Response
	def render_response(object, status = :ok)
		render json: object, status: status
	end

	def serialize_resource(resource, serializer, root: nil)
	    opts = { each_serializer: serializer, root: root }
	    ActiveModelSerializers::SerializableResource.new(resource, opts).as_json if resource
	end

	def success_response(data: data, status_code: :ok)
		render json: {
			success: true,
			errors: nil,
			data: data
		},
	       status: status_code
	end

	def error_response(data: data, status_code: :not_found)
		render json: {
			errors: data,
			data: {},
			success: false
		},
		status: status_code

	end
end