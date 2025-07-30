class SessionsController < ApplicationController
  allow_unauthenticated_access only: %i[new create]

  def new
  end

  def create
    if (user = User.authenticate_by(params.permit(:user_id, :password)))
      start_new_session_for user
      redirect_to after_authentication_url, notice: 'ログインしました'
    else
      redirect_to new_session_path, alert: 'ログインに失敗しました'
    end
  end

  def destroy
    terminate_session
    redirect_to new_session_path, notice: 'ログアウトしました'
  end
end
