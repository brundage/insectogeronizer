require 'spec_helper'

describe PapersController do

  shared_examples_for :rendering_edit do
    it('assigns @paper') { assigns[:paper].should_not be_nil }
    it('renders :edit') { response.should render_template :edit }
  end

  let(:paper) { mock_model Paper }
  let(:paper_attrs) { {} }

  describe 'POST create' do
    before { Paper.stub(:create).and_return(paper) }

    context :failure do
      before do
        paper.stub(:new_record?).and_return(true)
        post :create, paper_attrs
      end
      it_should_behave_like :rendering_edit
    end

    context :success do
      before do
        paper.stub(:new_record?).and_return(false)
        post :create, paper_attrs
      end
      it('redirects to :index') { response.should redirect_to papers_url }
    end
  end

  describe 'GET edit' do
    before do
      Paper.stub(:find).and_return(paper)
      get :edit, id: paper.id
    end
    it_should_behave_like :rendering_edit
  end


  describe 'GET index' do
    before { get :index }
    it 'assigns @papers' do
      assigns[:papers].should_not be_nil
    end
    it('renders :index') { response.should render_template :index }
  end


  describe 'GET new' do
    before { get :new }
    it_should_behave_like :rendering_edit
  end


  describe 'GET show' do
    before do
      Paper.stub(:find).and_return(paper)
      get :show, id: paper.id
    end
    it('assigns @paper') { assigns[:paper].should_not be_nil }
    it('renders :show') { response.should render_template :show }
  end


  describe 'PUT update' do
    before { Paper.stub(:find).and_return(paper) }

    context :failure do
      before do
        paper.stub(:update_attributes).and_return(false)
        put :update, id: paper.id, paper: paper_attrs
      end
      it_behaves_like :rendering_edit
    end

    context :success do
      before do
        paper.stub(:update_attributes).and_return(true)
        put :update, id: paper.id, paper: paper_attrs
      end
      it(:redirects) { response.should redirect_to papers_url }
    end
  end

end
