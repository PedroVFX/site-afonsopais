class VimeoItemsController < ApplicationController
  before_action :signed_in_user,
                only: [:index, :edit, :update, :destroy]
  #Desta maneira so o admin e que remove o(s) vimeo(s)
  #before_action :admin_user,     only: :destroy
  before_action :set_vimeo_item, only: [:show, :edit, :update, :destroy]

  # GET /vimeo_items
  # GET /vimeo_items.json
  def index
    @vimeo_items = VimeoItem.all.order('updated_at DESC')
  end

  # GET /vimeo_items/1
  # GET /vimeo_items/1.json
  def show
  end

  # GET /vimeo_items/new
  def new
    @vimeo_item = VimeoItem.new
  end

  # GET /vimeo_items/1/edit
  def edit
  end

  # POST /vimeo_items
  # POST /vimeo_items.json
  def create
    @vimeo_item = VimeoItem.new(vimeo_item_params)

    respond_to do |format|
      if @vimeo_item.save
        format.html { redirect_to @vimeo_item, notice: 'Vimeo item was successfully created.' }
        format.json { render :show, status: :created, location: @vimeo_item }
      else
        format.html { render :new }
        format.json { render json: @vimeo_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vimeo_items/1
  # PATCH/PUT /vimeo_items/1.json
  def update
    respond_to do |format|
      if @vimeo_item.update(vimeo_item_params)
        format.html { redirect_to @vimeo_item, notice: 'Vimeo item was successfully updated.' }
        format.json { render :show, status: :ok, location: @vimeo_item }
      else
        format.html { render :edit }
        format.json { render json: @vimeo_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vimeo_items/1
  # DELETE /vimeo_items/1.json
  def destroy
    @vimeo_item.destroy
    respond_to do |format|
      format.html { redirect_to vimeo_items_url, notice: 'Vimeo item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vimeo_item
      @vimeo_item = VimeoItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vimeo_item_params
      params.require(:vimeo_item).permit(:item, :nome, :descricao, :code_share)
    end

    # Before filters
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
