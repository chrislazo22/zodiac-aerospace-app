class SearchesController < ApplicationController
  
  def simple_search
  end
  
  def new
    @search = Search.new
  end
  
  def create
    @search = Search.create!(search_params)
    redirect_to @search
  end
  
  def show
    @x = 0
    
    @search = Search.find(params[:id])
  end
  
  private 
  
  def search_params
    params.require(:search).permit(:test_plan_search, :cushion_search, :seat_model_search)
  end
end
