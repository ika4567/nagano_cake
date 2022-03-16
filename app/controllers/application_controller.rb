class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :authenticate_customer!, :authenticate_admin!, except: [:top, :about]
  # before_action :authenticate_admin!, except: [:top, :about]

  private

  # 複数モデルでのリダイレクト先を指定
  def after_sign_in_path_for(resource_or_scope)
    if  resource_or_scope.class.name == "Admin"
      admin_root_path
    elsif resource_or_scope.class.name == "Customer"
      root_path
    end
  end
  

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :customer
      root_path
    elsif resource_or_scope == :admin
      new_admin_session_path
    else
      root_path
    end
  end

  # def after_inactive_sign_up_path_for(resource_or_scope)
  #   if  resource_or_scope.class.name == "Customer"
  #     my_page_path
  #   else
  #     root_path
  #   end
  # end

end
