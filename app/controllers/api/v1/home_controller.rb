class Api::V1::HomeController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :verify_access_token
  
  def search
    if params[:search_string]
      @result = Book.fulltext_search params[:search_string]
      @result = Author.fulltext_search params[:search_string] if @result.empty?
    end
    render json: @result
  end

  private
  def verify_access_token
    authenticate_or_request_with_http_token do |token, options|
      ApiKey.where(access_token: token).present?
    end
  end

end

