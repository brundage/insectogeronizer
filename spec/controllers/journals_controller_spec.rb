require 'spec_helper'

describe JournalsController do

  shared_examples_for :rendering_edit do
    it('assigns @journal') { assigns[:journal].should_not be_nil }
    it('renders :edit') { response.should render_template :edit }
  end

  let(:journal) { mock_model Journal }
  let(:journal_attrs) { {} }

  describe 'POST create' do
    before { Journal.stub(:create).and_return(journal) }

    context :failure do
      before do
        journal.stub(:new_record?).and_return(true)
        post :create, journal_attrs
      end
      it_should_behave_like :rendering_edit
    end

    context :success do
      before do
        journal.stub(:new_record?).and_return(false)
        post :create, journal_attrs
      end
      it('redirects to :index') { response.should redirect_to journals_url }
    end
  end

  describe 'GET edit' do
    before do
      Journal.stub(:find).and_return(journal)
      get :edit, id: journal.id
    end
    it_should_behave_like :rendering_edit
  end


  describe 'GET index' do
    before { get :index }
    it 'assigns @journals' do
      assigns[:journals].should_not be_nil
    end
    it('renders :index') { response.should render_template :index }
  end


  describe 'GET new' do
    before { get :new }
    it_should_behave_like :rendering_edit
  end


  describe 'GET show' do
    before do
      Journal.stub(:find).and_return(journal)
      get :show, id: journal.id
    end
    it('assigns @journal') { assigns[:journal].should_not be_nil }
    it('renders :show') { response.should render_template :show }
  end


  describe 'PUT update' do
    before { Journal.stub(:find).and_return(journal) }

    context :failure do
      before do
        journal.stub(:update_attributes).and_return(false)
        put :update, id: journal.id, journal: journal_attrs
      end
      it_behaves_like :rendering_edit
    end

    context :success do
      before do
        journal.stub(:update_attributes).and_return(true)
        put :update, id: journal.id, journal: journal_attrs
      end
      it(:redirects) { response.should redirect_to journals_url }
    end
  end

end
