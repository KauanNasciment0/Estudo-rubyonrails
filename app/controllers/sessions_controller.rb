class SessionsController < ApplicationController

  def new

  end

  def create

    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])

      session[:user_id] = user.id

      flash[:notice] = "Login realizado com sucesso!"

      redirect_to root_path
    else

      flash.now[:alert] = "E-mail ou senha inválidos."

      render :new, status: :unprocessable_entity
    end
  end

  def destroy

    session[:user_id] = nil

    flash[:notice] = "Sessão encerrada com sucesso."

    redirect_to login_path
  end
end