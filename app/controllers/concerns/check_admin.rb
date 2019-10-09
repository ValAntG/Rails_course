require 'active_support/concern'

module CheckAdmin
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_user!
    before_action :check_admin
  end

  protected
  def check_admin
    redirect_to root_path, alert: 'У Вас нет прав на просмотр данной страницы!!' unless current_user.admin?
  end
end
