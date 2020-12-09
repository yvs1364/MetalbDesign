module Api
  module V1
    class ReviewsController < ApplicationController
      respond_to :json

      def index
        respond_with Review.all
        @reviews = policy_scope(Review).order(created_at: :desc)
      end

      def show
        respond_with Review.find(params[:id])
        authorize @review
      end

      def create
        respond_with Review.create(params[:review])
        authorize @review
      end

      def destroy
        respond_with Review.destroy(params[:id])
        authorize @review
      end
    end
  end
end
