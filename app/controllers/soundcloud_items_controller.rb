class SoundcloudItemsController < ApplicationController
  before_action :signed_in_user,
                only: [:index, :edit, :update, :destroy]
  #Desta maneira so o admin e que remove o(s) soundcloud(s)
  #before_action :admin_user,     only: :destroy
  before_action :set_soundcloud_item, only: [:show, :edit, :update, :destroy]

  # GET /soundcloud_items
  # GET /soundcloud_items.json
  def index
    @soundcloud_items = SoundcloudItem.all.order('updated_at DESC')
  end

  # GET /soundcloud_items/1
  # GET /soundcloud_items/1.json
  def show
  end

  # GET /soundcloud_items/new
  def new
    @soundcloud_item = SoundcloudItem.new
  end

  # GET /soundcloud_items/1/edit
  def edit
  end

  # POST /soundcloud_items
  # POST /soundcloud_items.json
  def create
    @soundcloud_item = SoundcloudItem.new(soundcloud_item_params)

    respond_to do |format|
      if @soundcloud_item.save
        format.html { redirect_to @soundcloud_item, notice: 'Soundcloud item was successfully created.' }
        format.json { render :show, status: :created, location: @soundcloud_item }
      else
        format.html { render :new }
        format.json { render json: @soundcloud_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /soundcloud_items/1
  # PATCH/PUT /soundcloud_items/1.json
  def update
    respond_to do |format|
      if @soundcloud_item.update(soundcloud_item_params)
        format.html { redirect_to @soundcloud_item, notice: 'Soundcloud item was successfully updated.' }
        format.json { render :show, status: :ok, location: @soundcloud_item }
      else
        format.html { render :edit }
        format.json { render json: @soundcloud_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /soundcloud_items/1
  # DELETE /soundcloud_items/1.json
  def destroy
    @soundcloud_item.destroy
    respond_to do |format|
      format.html { redirect_to soundcloud_items_url, notice: 'Soundcloud item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_soundcloud_item
      @soundcloud_item = SoundcloudItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def soundcloud_item_params
      params.require(:soundcloud_item).permit(:item, :nome, :descricao, :url_share)
    end

    # Before filters
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
