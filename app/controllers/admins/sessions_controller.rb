class Admins::SessionsController < Devise::SessionsController
	
  
  def after_sign_in_path_for(resource)
    #redirect_to edit_admin_registration
    edit_admin_registration_path
  end

  def after_sign_out_path_for(resource_or_scope)
    #after log out redirect the admin alla pagina che si stava visitando
    request.referrer
  end

  



end