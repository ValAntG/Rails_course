class Admin::BaseController < ApplicationController
  protect_from_forgery with: :exception, prepend: true
  include CheckAdmin
end
