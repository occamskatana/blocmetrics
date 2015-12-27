class RegisteredApplicationsController < ApplicationController

  def index
    @registered_applications = RegisteredApplication.all
  end
  def new
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end
end
