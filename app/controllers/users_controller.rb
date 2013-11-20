class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to cats_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def edit
    @user = User.find([:id])
  end

  def update
  end

  def show
    @user = User.find([:id])
  end

  def index
    @users = User.all
  end

  def destroy

  end

end
