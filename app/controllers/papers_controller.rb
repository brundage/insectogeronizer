class PapersController < ApplicationController

  def create
    @paper = Paper.create params[:paper]
    @paper.new_record? ? render(:edit) : redirect_to(papers_url)
  end


  def edit
    @paper = Paper.find params[:id]
  end


  def index
    @papers = Paper.all
  end


  def new
    @paper = Paper.new
    render :edit
  end


  def show
    @paper = Paper.find params[:id]
  end


  def update
    @paper = Paper.find params[:id]
    @paper.update_attributes(params[:paper]) ? redirect_to(papers_url) : render(:edit)
  end

end
