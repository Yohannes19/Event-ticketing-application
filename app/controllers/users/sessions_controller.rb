class Users::SessionsController < Devise::SessionsController
  # Override the sign_in method to include redirection logic
  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_root_path  # Redirect to admin dashboard
    else
      events_path      # Redirect to the user events path
    end
  end
end
