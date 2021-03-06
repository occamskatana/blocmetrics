class API::EventsController < ApplicationController

	skip_before_action :verify_authenticity_token
	before_filter :set_access_control_headers

	
	def create
		application = Application.find_by(url:request.env['HTTP_ORIGIN'])

		if application == nil
			render json: "Unregistered application", status: :unprocessable_entity
		else

			event = application.events.create!(event_params)

			if event.valid?
				event.save!
				render json: @event, status: :created
			else
				render event.errors, status: :unprocessable_entity
			end
		end
	end

	def preflight
		head 200
	end


	 def set_access_control_headers
 # #1
     headers['Access-Control-Allow-Origin'] = '*'
 # #2
     headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
 # #3
     headers['Access-Control-Allow-Headers'] = 'Content-Type'
   end


	private

	def event_params
		params.require(:event).permit(:format, :name)
	end

end