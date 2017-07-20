class SpecimenController < ApplicationController
before_action :set_specimen, only: [:show, :edit, :update] 

  def index
    @specimen = Speciman.all
    if params[:search]
      @specimen = Speciman.search(params[:search]).order("created_at DESC")
    else
      @specimen = Speciman.all.order("created_at DESC")
    end
  end

  def new
    @specimen = Speciman.new
  end
  
  def show
  end
  
  def edit
  end
  
  def create 
    @specimen = Speciman.new(specimen_params)
    if @specimen.save
      redirect_to @specimen, notice: 'The material was added successfully'
    else
      render :new
    end
  end
  
  def update
    if @specimen.update(specimen_params)
      redirect_to @specimen, notice: 'Workout was successfully updated.'
    else
      render action: 'edit'
    end
  end
  
  def search
  end
  
  private 

  def set_specimen
    @specimen = Speciman.find(params[:id])
  end
  
  def specimen_params
    params.require(:speciman).permit(:test_plan)
  end
end


