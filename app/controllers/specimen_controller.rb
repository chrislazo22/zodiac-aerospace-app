class SpecimenController < ApplicationController
  def new
    @specimen = Speciman.new
  end
end
