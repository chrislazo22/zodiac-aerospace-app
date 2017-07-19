class SpecimenController < ApplicationController

  def new
    @specimen = Speciman.new
  end
  
  def create 
    @specimen = Speciman.new(specimen_params)
    if @specimen.save
      redirect_to @specimen, notice: 'The material was added successfully'
    else
      render :new
    end
  end
  
  def show
    @specimen = Speciman.find(params[:id])
  end

end

private 

def specimen_params
  params.require(:speciman).permit(:test_plan)
end