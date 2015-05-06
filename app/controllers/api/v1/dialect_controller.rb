class Api::V1::DialectController < ApplicationController
  def translate
    if bad_request?
      handle_bad_request

      return
    end

    translation = Translation.new(params[:dialect], params[:message])

    render :json => { :translation => translation.translate, :dialect => params[:dialect] }, :status => 200
  end

  private

  def bad_request?
    params[:dialect].blank? or params[:message].blank?
  end

  def handle_bad_request
    render :json => { :message => "Bad request" }, :status => 400
  end
end
