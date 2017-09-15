class SpecimenController < ApplicationController
before_action :set_specimen, only: [:show, :edit, :update, :destroy] 

  def index
    @specimen = Speciman.all.page(params[:page]).per_page(25)
    if params[:search]
      @specimen = Speciman.search(params[:search]).page(params[:page]).per_page(25)
    end
    @x = 0
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
      redirect_to @specimen, notice: 'Material was added successfully'
    else
      render :new
    end
  end
  
  def update
    if @specimen.update(specimen_params)
      redirect_to @specimen, notice: 'Material was successfully updated.'
    else
      render 'edit'
    end
  end
  
  def destroy
    @specimen.destroy
    redirect_to specimen_path, notice: "Material was deleted"
  end
  
  private 

  def set_specimen
    @specimen = Speciman.find(params[:id])
  end
  
  def specimen_params
    params.require(:speciman).permit(:pass_or_fail, :test_plan, :cushion, :test_plan_id, :seat_model, :test_date, :vert_burn_length_front, :vert_burn_length_back, :horiz_burn_length_top, :horiz_burn_length_bottom, :weight_loss_percent, :weight_loss_lbs, :cover_config, :foam_a_material, :foam_a_percent, :foam_b_material, :foam_b_percent, :foam_c_material, :foam_c_percent, :foam_d_material, :foam_d_percent, :foam_e_material, :foam_e_percent, :decorative_insulation_part_number, :decorative_insulation_mfr, :backing, :adhesive_one, :adhesive_two, :fireblock_type, :fireblock_part_number, :fireblock_color, :fireblock_mfr, :flame_treatment, :fireblock_percent, :thermoplastic_part_number, :thermoplastic_mfr)
  end
end