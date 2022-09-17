class ListsController < ApplicationController
  before_action :set_list, only: [:edit, :show, :update]

  def index
    @lists = List.all
  end

  def show; end

  def new
    @list = List.new
  end

  def create
    @lists = List.new(list_param)
    if @list.new
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @list.update(list_params)
      redirect_to list_path(@list)
    else
      render :edit
    end
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.requiere(:list).permit(:name)
  end
end
