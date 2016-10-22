class RegistrationsController < Devise::RegistrationsController

  def after_sign_up_path_for(resource)
    new_organizacao_path # Or :prefix_to_your_route
  end

  def new
    super
    @token = params[:invite_token]
  end
  
  def create
    super
    @token = params[:invite_token]
    if @token
      org =  Invite.find_by_token(@token).organizacao #find the user group attached to the invite
      @newUser.update_attribute(:organizacao, org) #add this user to the new user group as a member
    end
  end

end
