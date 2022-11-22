class GrandparentsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_grandparent, only: %i[show edit update destroy]
  # before_action :set_user, only: %i[new create]

  # GET /grandparent
  def index
    @grandparents = Grandparent.all
  end

  # GET /grandparents/:id
  def show
  end

  # GET /grandparents/new
  def new
    @grandparent = Grandparent.new
    @grandparent.user = current_user
  end

  # POST "grandparents"
  def create
    @grandparent = Grandparent.new(grandparent_params)
    @grandparent.user = current_user
    if @grandparent.save
      redirect_to grandparent_path(@grandparent)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /grandparents/:id/edit
  def edit
  end

  # PATH /grandparents/:id
  def update
    @grandparent.update(grandparent_params)
    if @grandparent.save
      redirect_to grandparent_path(@grandparent)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # DELETE "grandparents/:id"
  def destroy
    @grandparent = Grandparent.find(params[:id])
    @grandparent.destroy
    redirect_to grandparent_path(@grandparent.grandparent), status: :see_other
  end

  private

  def set_grandparent
    @grandparent = Grandparent.find(params[:id])
  end

  def grandparent_params
    params.require(:grandparent).permit(:name, :description, :age)
  end
end
