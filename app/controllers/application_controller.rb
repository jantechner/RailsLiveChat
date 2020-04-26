# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user
  before_action :check_user

  def check_user
    logger.debug "Current user #{current_user}"
    redirect_to new_session_path unless current_user
  end

  def current_user
    return unless session[:user_id]

    @current_user ||= session[:user_id] && User.find(session[:user_id])
  end
end
