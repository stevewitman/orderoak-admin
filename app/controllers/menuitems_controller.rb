class MenuitemsController < ApplicationController
  before_action :authorize_manager
  before_action :set_store
  before_action :set_menuitem, only: [:show, :edit, :update, :destroy]

  def index
    @menuitems = @store.menuitem.all
  end

  def show
  end

  def new
    @menuitem = @store.menuitems.new
  end

  def create
    @menuitem = @store.menuitems.new(menuitem_params)
    if @menuitem.save
      redirect_to store_path(@store), notice: 'Menu Item was added successfully.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @menuitem.update(menuitem_params)
      redirect_to store_path(@store), notice: 'Menu Item was updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @menuitem.destroy
    redirect_to store_path(@store), notice: 'Menu Item was deleted successfully.'
  end

private

  def set_store
    begin
      if params[:store_id]
        @store = Store.find(params[:store_id])
      end
    rescue ActiveRecord::RecordNotFound
      raise AccessDenied
    end
  end

  def set_menuitem
    @menuitem = Menuitem.find(params[:id])
  end

  def menuitem_params
    params.require(:menuitem).permit(:store_id, :menugroup, :name, :description, :price, :in_stock, :photo, :position)
  end

end
