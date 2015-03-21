class MenusController < ApplicationController
  before_action :authorize_manager
  before_action :set_store, only: [:show, :edit, :update, :destroy]
  before_action :set_menu, only: [:show, :edit, :update, :destroy]

  def index
    @menus = Menu.all
  end

  def new
    @menu = Menu.new
  end

private

  def menu_params
    params.require(:menu).permit(:store_id, :group, :position)
  end

  def set_store
    begin
      if params[:store_id]
        @store = Store.find(params[:store_id])
      end
    rescue ActiveRecord::RecordNotFound
      raise AccessDenied
    end
  end

  def set_menu
    @menu = Menu.find(params[:id])
  end

end
