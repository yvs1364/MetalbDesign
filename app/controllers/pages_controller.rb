class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @items = Item.order(id: :desc).first(3)
  end
end
