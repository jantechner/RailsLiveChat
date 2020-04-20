# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    return unless session[:user_id]
    @current_user ||= User.exists?(session[:user_id]) ? User.find(session[:user_id]) : nil

  end
end
