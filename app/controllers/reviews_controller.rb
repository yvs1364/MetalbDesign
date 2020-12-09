class ReviewsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[create new]

  def new
    @item = Item.find(params[:item_id])
    @review = Review.new
    authorize @review
  end

  def create
    @item = Item.find(params[:item_id])
    @review = policy_scope(Review).order(created_at: :desc)
    @review = Review.new(params_review)
    @review.item = @item
    if @review.save
      redirect_to item_path(@item, anchor: "review-#{@review.id}")
    else
      render "items/show"
    end
    authorize @review
  end

  def edit
    @item = Item.find(params[:item_id])
    @review = @item.reviews.find(params[:id])
    authorize @review
  end

  def update
    @item = Item.find(params[:item_id])
    @review = @item.reviews.find(params[:id])
      if @review.update(params_review_edit)
        flash[:notice] = "You accomplished a task!"
       redirect_to item_path(@item, anchor: "review-#{@review.id}")
      else
        flash[:alert] = "Il faut 20 caractères mini"
        redirect_to edit_item_review_path
      end
    authorize @review
  end

  def destroy
    @item = Item.find(params[:item_id])
    @review = @item.reviews.find(params[:id])
    @review.destroy
    redirect_to item_path(@item)
    authorize @review
  end

  private

  def params_review_edit
    params.require(:review).permit(:content)
  end

  def params_review
    params.require(:review).permit(:title, :content, :name)
  end
end
