class RegistrationsController < Devise::RegistrationsController
  private
    def after_sign_up_path_for(user)
      edit_user_path(user)
    end
end
