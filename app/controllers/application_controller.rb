class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    if current_user.admin?
      admin_welcome_index_path
    else
      new_search_path
    end
  end
end
