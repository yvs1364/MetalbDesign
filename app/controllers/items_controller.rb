class ItemsController < ApplicationController
  include Pundit
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_item, only: %i[show edit update destroy destroy_multiple]

  def index
    @items = policy_scope(Item).order(created_at: :desc)
    # respond_to do |format|
    #   format.html
    #   format.json { render json: @items }
    # end
  end

  def new
    @item = Item.new
    authorize @item
  end

  def show
    @review = Review.new
    authorize @item
  end

  def create
    @item = policy_scope(Item).order(created_at: :desc)
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    if @item.save
      # pour vérifier si il y a des photos ajouter et si oui ça les affiche idem pour update
      if params[:item][:photos].present?
        params[:item][:photos].each do |photo|
          @item.photos.attach(photo)
        end
      end
      redirect_to item_path(@item)
    else
      render "new"
    end
    authorize @item
  end

  def destroy
    if @item.destroy
      flash[:notice] = "You accomplished a task!"
      redirect_to items_path
    else
      flash.now[:alert] = "There was an error deleting the task. Try again."
    end
    authorize @item
  end

  def edit
    authorize @item
  end

  def update
    if @item.update(item_params)
      if params[:item][:photos].present?
        params[:item][:photos].each do |photo|
          @item.photos.attach(photo)
        end
      end
    end
    redirect_to item_path(@item)
    authorize @item
  end

  def destroy_multiple
    attachments = ActiveStorage::Attachment.where(id: params[:deleted_img_ids])
    attachments.map(&:purge)
    redirect_to item_path(@item)
    authorize @item
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :user_id)
  end
end
