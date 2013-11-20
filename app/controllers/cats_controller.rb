class CatsController < ApplicationController

  def new
    @cat = Cat.new
  end

  def create
    @cat = Cat.new(params[:cat])
    @cat.owner_id = current_user.id
    if @cat.save
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :new
    end
  end

  def edit
    @cat = Cat.find(params[:id])
  end

  def update
  end

  def show
    @cat = Cat.find(params[:id])
  end

  def index
    @cats = Cat.all
  end

  def destroy
  end

end
