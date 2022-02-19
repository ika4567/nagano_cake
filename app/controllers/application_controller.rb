class ApplicationController < ActionController::Base

  private
  
  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope == :admin
      admin_root_path
    end
  end

end
