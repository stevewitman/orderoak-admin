class API::V1::StoresController < ApplicationController
  before_action :set_store, only: :show

  def index
    @stores = Store.all
    respond_to do |format|
      format.json { render :json => @stores }
    end
  end

  def show
    @store = Store.find(params[:id])
    @menu = {}
    if @store.menugroups != ""
      @menugroups = @store.menugroups.split(',')
      @menugroups.each do |menugroup|
        menuitems = @store.menuitems.where(menugroup: menugroup).order(:position).pluck(:id, :name, :description, :price)

        @menu[menugroup] = menuitems
      end
    end
    respond_to do |format|
      format.json { render json: @menu}
    end
  end

private

  def set_store
    @store = Store.find(params[:id])
  end

end
