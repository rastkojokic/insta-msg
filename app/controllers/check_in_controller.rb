class CheckInController < ApplicationController
  before_filter :check_session, :only => [:new]
  before_filter :validate_check_in, :only => [:create]

  def new
  end

  def create
    create_check_in

    redirect_to chat_index_path
  end

  private

  def create_check_in
    session[:check_in] = checkin_attributes
  end

  def checkin_attributes
    { :username => params[:username], :dialect => params[:dialect] }
  end

  def check_session
    if check_in_present?
      redirect_to chat_index_path
    end
  end

  def check_in_present?
    session[:check_in].present? and session[:check_in]["username"].present? and session[:check_in]["dialect"].present?
  end

  def validate_check_in
    if params[:username].blank? or params[:dialect].blank?
      redirect_to check_in_new_path, :flash => { :error => "Username must be specified during check in" }
    end
  end
end
