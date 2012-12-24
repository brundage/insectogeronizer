class JournalsController < ApplicationController

  autocomplete :journal, :name, full: true

  def create
    @journal = Journal.create params[:journal]
    @journal.new_record? ? render(:edit) : redirect_to(journals_url)
  end


  def edit
    @journal = Journal.find params[:id]
  end


  def index
    @journals = Journal.all
  end


  def new
    @journal = Journal.new
    render :edit
  end


  def show
    @journal = Journal.find params[:id]
  end


  def update
    @journal = Journal.find params[:id]
    @journal.update_attributes(params[:journal]) ? redirect_to(journals_url) : render(:edit)
  end

end
