class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  include AuthHelpers

  protect_from_forgery with: :null_session, unless: -> { request.format.json? }
end
