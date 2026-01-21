class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?


  allow_browser versions: :modern

  private
  def current_user


    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?

    !!current_user
  end

  def require_user
    unless logged_in?
      flash[:alert] = "Você precisa estar logado para acessar esta página."
      redirect_to login_path
    end
  end

  def require_admin
    if !logged_in?
      flash[:alert] = "Você precisa estar logado para acessar esta página."
      redirect_to login_path and return

      elsif current_user.admin !=true
       flash[:alert] = "Acesso restrito a administradores."
        redirect_to root_path and return

    end
  end

end