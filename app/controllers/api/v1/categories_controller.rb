class Api::V1::CategoriesController < ApplicationController
  before_action :set_category, only: :destroy
  def index
    @categories = Category.all
    render json: CategorySerializer.new(@categories), status: :ok
  end
  def create
    @category = Category.create(category_params)
    if @category.save
      render json: CategorySerializer.new(@category), status: :created
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end
  def destroy
    @category.destroy
    head :no_content
  end
  
  private
  def category_params
    params.permit(:name, :description, :id_parent)
  end
  def set_category
    @category = Category.find(params[:id])
  end
end