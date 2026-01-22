class UsersController < ApplicationController
  before_action :require_admin, only: [:index, :make_admin]

  def new
    @user = User.new

  end

  def index
    @users = User.all
  end

  def create

    @user = User.new(user_params)


    if @user.save

      redirect_to root_path, notice: "Cadastro realizado com sucesso! Por favor, faça login."
    else

      render :new, status: :unprocessable_entity
    end
  end

  def make_admin
    @user = User.find(params[:id])
    if @user.update(admin: true)
      redirect_to users_path, notice: "Agora #{@user.name} é um administrador!"
    else
      redirect_to users_path, alert: "Não foi possível tornar este usuário admin."
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end