class ApplicationController < ActionController::Base
  http_basic_authenticate_with name: "agatov", password: "Fiolent"
  protect_from_forgery
end
