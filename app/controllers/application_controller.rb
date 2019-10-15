class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    current_user.admin? ? admin_welcome_index_path : new_search_path
  end
end
