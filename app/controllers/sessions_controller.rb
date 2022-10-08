class SessionsController < ApplicationController
  before_action :ensure_signed_out, only: [:new, :auth]

  def new
  end

  def auth
    user_info = request.env['omniauth.auth']

    user = User.find_or_initialize_by email: user_info.extra.id_info.email
    if user.save
      session[:user_id] = user.id

      @account = user.accounts.find_or_initialize_by email: user_info.extra.id_info.email
      @account.access_token = user_info.credentials.token
      @account.save
      redirect_to session.fetch(:redirect_to, root_path)
    else
      render 'new'
    end
  end
end
