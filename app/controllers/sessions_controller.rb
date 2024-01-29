class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id 
      send_welcome_email(user) if user.present?
      redirect_to root_url, notice: "Logged in!"
    else 
      flash.now[:alert] = "Email or Password is invalide"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out"
  end

  private

  def send_welcome_email(user)
    begin
      Rails.logger.debug("Attempting to send welcome email to #{user.email}")
      UserMailer.welcome_email(user).deliver_now
      Rails.logger.debug("Welcome email successfully sent to #{user.email}")
    rescue => e
      Rails.logger.error("Error sending welcome email: #{e.message}")
    end
  
  end
end
