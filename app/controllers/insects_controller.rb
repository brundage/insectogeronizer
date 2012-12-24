class InsectsController < ApplicationController

  def create
    @insect = Insect.create params[:insect]
    @insect.new_record? ? render(:edit) : redirect_to(insects_url)
  end


  def edit
    @insect = Insect.find params[:id]
  end


  def index
    @insects = Insect.all
  end


  def new
    @insect = Insect.new
    render :edit
  end


  def show
    @insect = Insect.find params[:id]
  end


  def update
    @insect = Insect.find params[:id]
    @insect.update_attributes(params[:insect]) ? redirect_to(insects_url) : render(:edit)
  end

end
