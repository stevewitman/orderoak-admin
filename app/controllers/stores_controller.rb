class StoresController < ApplicationController
  before_action :authorize_admin
  before_action :set_store, only: [:show, :edit, :update, :destroy]

  def index
    @stores = Store.all
  end

  def show
    @store = Store.find(params[:id])
    @menuitems = @store.menuitems.all
    @menuitems = @menuitems.group_by { |obj| obj.menugroup }.values
    p "*********************"
    p @menuitems
    p "*********************"




  end

  def new
    @store = Store.new
  end

  def edit
  end

  def create
    @store = Store.new(store_params)
    if @store.save
      redirect_to store_path(@store), notice: 'Restaurant was added successfully.'
    else
      render :new
    end
  end

  def update
    if @store.update(store_params)

      redirect_to store_path(@store), notice: 'Restaurant was updated successfully.'
    else
      render :edit
    end
  end

private

  def set_store
    @store = Store.find(params[:id])
  end

  def store_params
    params.require(:store).permit(:name, :address, :city, :state, :zip, :phone, :url, :latitude, :longitude)
  end

end
