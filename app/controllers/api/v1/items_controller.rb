module Api
  module V1
    class ItemsController < ApplicationController
      respond_to :json

      def index
        respond_with Item.all
        @items = policy_scope(Item).order(id: :desc)
      end

      def show
        respond_with Item.find(params[:id])
        authorize @item
      end

      def create
        respond_with Item.create(params[:item])
        authorize @item
      end

      def destroy
        respond_with item.destroy(params[:id])
        authorize @item
      end
    end
  end
end
