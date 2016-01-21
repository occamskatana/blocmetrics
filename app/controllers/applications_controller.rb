class ApplicationsController < ApplicationController

  before_action :authenticate_user!

  before_action :authorize_user

  def index
  	@user = User.find(params[:user_id])
  	@applications = @user.applications

  end

  def show
  	@user = User.find(params[:user_id])
  	@application = Application.find(params[:id])
    @events = @application.events
  end

  def new
  	@user = User.find(params[:user_id])
  	@applicaion = Application.new
  end


  def create
  	@user = User.find(params[:user_id])
  	@application = @user.applications.build(application_params)

  	if @application.save
  		flash[:notice] = "Thanks for registering your application"
  		redirect_to user_applications_path(current_user)
  	else
  		flash[:error] = "There was a problem registering your application"
  		redirect_to new_user_application_path
  	end
  end



  def destroy
  	@application = Application.find(params[:id])

  	if @application.destroy
  		flash[:notice] = "Successfully destroyed"
  		redirect_to user_applications_path(current_user)
  	else
  		flash[:error] = "No Dice"
  		redirect_to user_applications_path(current_user)
  	end
  end

  def edit
  	@application = Application.find(params[:id])
  	@user = User.find(params[:user_id])
  end

  def update
  	@application = Application.find(params[:id])
  	@application.assign_attributes(application_params)
  	@user = User.find(params[:user_id])

  	if @application.save
  		flash[:notice] = "Your app has been updated."
  		redirect_to user_applications_path(current_user)
  	else
  		flash[:error] = "Your application was not able to be updated"
  		redirect_to edit_user_application_path(@user, @application)
  	end
  end


 	private

  def authorize_user
    user = User.find(params[:user_id])
    unless current_user.admin? || user == current_user
      flash[:alert] = "You are not authorized to do that"
      redirect_to root_path
    end
  end



 	def application_params
 		params.require(:application).permit(:user, :name, :url)
 	end

end
