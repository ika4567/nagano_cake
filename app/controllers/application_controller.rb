class ApplicationController < ActionController::Base
  before_action :authenticate_customer!, except: [:top, :about]
  before_action :authenticate_admin!

  private

  def after_sign_in_path_for(resource_or_scope)
    if  resource_or_scope.class.name == "Admin"
      admin_root_path
    else
      root_path
    end
  end

  def after_sign_out_path_for(resource)
    root_path
  end

end
