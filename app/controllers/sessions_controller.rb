# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :check_user, only: [:new, :create]
  def new; end

  def create
    user = User.find_by_email(params[:email])
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      logger.debug "User #{session[:user_id]}"
      redirect_to root_url, notice: 'Logged in!'
    else
      flash.now[:alert] = 'Email or password is invalid'
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id);
    @current_user = nil;
    redirect_to root_url, notice: 'Logged out!'
  end
end
