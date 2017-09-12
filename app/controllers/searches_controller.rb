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
    params.require(:search).permit(:test_plan_search, :cushion_search, :seat_model_search, :foam_a_material_search, :foam_b_material_search, :fireblock_type_search, :fireblock_part_number_search, :flame_treatment_search)
  end
end
