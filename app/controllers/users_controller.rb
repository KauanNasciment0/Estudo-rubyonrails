class UsersController < ApplicationController
  before_action :require_admin, only: [:index, :make_admin, :remove_admin]
  before_action :require_correct_user, only: [:edit, :update]
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

  def edit
    @user = User.find(params[:id])
  end

  def update

    if @user.update(user_params)
      redirect_to root_path, notice: "Perfil atualizado com sucesso!"
    else
      render :edit, status: :unprocessable_entity
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

  def remove_admin
    @user = User.find(params[:id])
    if @user.update(admin: false)
      redirect_to users_path, notice: "Poderes de administrador removidos de #{@user.name}."
    else
      redirect_to users_path, alert: "Não foi possível remover o acesso."
    end
  end

  private

  def user_params
    allowed_params = [:name, :email, :password, :password_confirmation]

    if current_user&.admin?
      allowed_params << :admin
    end

    params.require(:user).permit(allowed_params)
  end

end