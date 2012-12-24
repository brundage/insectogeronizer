require 'spec_helper'

describe InsectsController do

  shared_examples_for :rendering_edit do
    it('assigns @insect') { assigns[:insect].should_not be_nil }
    it('renders :edit') { response.should render_template :edit }
  end

  let(:insect) { mock_model Insect }
  let(:insect_attrs) { {} }

  describe 'POST create' do
    before { Insect.stub(:create).and_return(insect) }

    context :failure do
      before do
        insect.stub(:new_record?).and_return(true)
        post :create, insect_attrs
      end
      it_should_behave_like :rendering_edit
    end

    context :success do
      before do
        insect.stub(:new_record?).and_return(false)
        post :create, insect_attrs
      end
      it('redirects to :index') { response.should redirect_to insects_url }
    end
  end

  describe 'GET edit' do
    before do
      Insect.stub(:find).and_return(insect)
      get :edit, id: insect.id
    end
    it_should_behave_like :rendering_edit
  end


  describe 'GET index' do
    before { get :index }
    it 'assigns @insects' do
      assigns[:insects].should_not be_nil
    end
    it('renders :index') { response.should render_template :index }
  end


  describe 'GET new' do
    before { get :new }
    it_should_behave_like :rendering_edit
  end


  describe 'GET show' do
    before do
      Insect.stub(:find).and_return(insect)
      get :show, id: insect.id
    end
    it('assigns @insect') { assigns[:insect].should_not be_nil }
    it('renders :show') { response.should render_template :show }
  end


  describe 'PUT update' do
    before { Insect.stub(:find).and_return(insect) }

    context :failure do
      before do
        insect.stub(:update_attributes).and_return(false)
        put :update, id: insect.id, insect: insect_attrs
      end
      it_behaves_like :rendering_edit
    end

    context :success do
      before do
        insect.stub(:update_attributes).and_return(true)
        put :update, id: insect.id, insect: insect_attrs
      end
      it(:redirects) { response.should redirect_to insects_url }
    end
  end

end
