class API::V1::StoresController < ApplicationController
  before_action :set_store, only: :show
  before_filter :cors_preflight_check
  after_filter :cors_set_access_control_headers

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

  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
    headers['Access-Control-Max-Age'] = "1728000"
  end

  def cors_preflight_check
    if request.method == 'OPTIONS'
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
      headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version, Token'
      headers['Access-Control-Max-Age'] = '1728000'

      render :text => '', :content_type => 'text/plain'
    end
  end

end
