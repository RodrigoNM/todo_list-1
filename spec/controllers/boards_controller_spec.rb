require 'rails_helper'

RSpec.describe BoardsController, :type => :controller do
  context "GET #index" do
    it "should success and render to index page" do
      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
    end
    it "should array empty" do
      get :index
      expect(assigns(:boards)).to be_empty
    end
    it "shoul have one board" do 
      create(:board)
      get :index
      expect(assigns(:boards)).to_not be_empty
    end
  end

  context "GET #show" do
    let(:board) {create(:board)}
    it "should success and render to edit page" do
      get :show, params: {id: board.id}
      expect(response).to have_http_status(200)
      expect(response).to render_template(:show)
    end

    it "where have id" do
      get :show, params: {id: board.id}
      expect(assigns(:board)).to be_a(Board)
      expect(assigns(:board)).to eq(board)
    end
  end

  context "GET #new" do
    it "should success and render to new page" do 
      get :new
      expect(response).to have_http_status(200)
      expect(response).to render_template(:new)
    end

    it "should new board" do
      get :new
      expect(assigns(:board)).to be_a(Board)
      expect(assigns(:board)).to be_a_new(Board)
    end
  end

  context "GET #edit" do
    let(:board) {create(:board)}
    it "should success and render to edit page"do
      get :edit, params: {id: board.id}
      expect(response).to render_template(:edit)
      expect(assigns(:board)).to be_a(Board)
    end
  end
  context "POST #create" do
    let!(:params){
      { title: "An awsome board" }
    }
    it 'saves new article' do
      expect do
        post :create, params: { board: params }, session: {}
      end.to change(Board, :count).by(1)
    end

    
  end
    context "PUT #update" do
      let!(:board) {create(:board)}
      let(:update_attributes) do
        {title: 'update title' }
      end

      it 'updates updated article' do
        patch :update, params: { id: board.id, board: update_attributes }, session: {}
        board.reload
        expect(board.title).to eq update_attributes[:title]
      end
      it "should not update post info" do
        params = {title:nil}
        put :update, params: {id: board.id, board: params}
        expect(response).to render_template(:edit)
    end
  end


  context "DELETE #destroy" do
    let!(:board) { create(:board) }
    it 'deletes the board' do
      expect do
        delete :destroy, params: { id: board.id }, session: {}
      end.to change(Board, :count).by(-1)
    end

    
  end
end