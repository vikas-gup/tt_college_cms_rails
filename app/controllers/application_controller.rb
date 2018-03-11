class ApplicationController < ActionController::Base
  #protect_from_forgery with: :exception
  rescue_from Apipie::ParamError do |e|
    render text: e.message, status: :unprocessable_entity
  end
end
