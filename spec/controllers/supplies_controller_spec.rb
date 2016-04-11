require 'rails_helper'
require 'spec_helper'

describe SuppliesController do
  describe 'GET #index as an admin user' do
    login_admin
    it 'populates an array of all supplies' do
      supply1 = FactoryGirl.create(:supply, name: "paints")
      supply2 = FactoryGirl.create(:supply, name: "crayons")
      supply3 = FactoryGirl.create(:supply, name: "pencils")
      get :index
      expect(assigns(:supplies)).to match_array([supply1, supply2, supply3])
    end

    it 'renders the :index view' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #index as a normal user redirects to user show page' do
    login_user
    it 'redirects to the user\'s show page' do
      get :index
      expect(response).to redirect_to("/users/#{subject.current_user.id}")
    end
  end

  describe 'GET #show' do
    it 'assigns the requested supply to @supply' do
      supply = FactoryGirl.create(:supply)
      get :show, id: supply
      expect(assigns(:supply)).to eq supply
    end

    it 'renders the :show template' do
      supply = FactoryGirl.create(:supply)
      get :show, id: supply
      expect(response).to render_template :show
    end
  end

  describe 'GET #edit as an admin user' do
    login_admin
    it 'assigns the requested supply to @supply' do
      supply = FactoryGirl.create(:supply)
      get :edit, id: supply
      expect(assigns(:supply)).to eq supply
    end

    it 'renders the :edit template' do
      supply = FactoryGirl.create(:supply)
      get :edit, id: supply
      expect(response).to render_template :edit
    end
  end

  describe 'GET #edit as a normal user' do
    login_user
    it 'does not render the :edit template' do
      supply = FactoryGirl.create(:supply)
      get :edit, id: supply
      expect(response).to redirect_to("/users/#{subject.current_user.id}")
    end
  end

  describe 'POST #create as an admin user' do
    login_admin

    before :each do
      @student_class = FactoryGirl.create(:student_class)
    end
    context 'as an admin user and with valid attributes' do
      it 'saves the new supply in the database' do
        expect{ 
          post :create, supply: FactoryGirl.attributes_for(:supply, student_class_id: @student_class.id)
          }.to change(Supply, :count).by(1)
      end

      it 'redirects to supplies#show' do
        post :create, supply: FactoryGirl.attributes_for(:supply, student_class_id: @student_class.id)
        expect(response).to redirect_to :action => :show, :id => assigns(:supply).id
      end
    end

    context 'as an admin user and with invalid attributes' do
      it 'does not save the new supply in the database' do
        expect{
          post :create, supply: FactoryGirl.attributes_for(:supply, student_class_id: @student_class.id, name: nil)
        }.to_not change(Supply, :count)
      end
      it 're-reders the #new template' do
        post :create, supply: FactoryGirl.attributes_for(:supply, student_class_id: @student_class.id, name: nil)
        expect(response).to render_template :new
      end
    end
  end

  describe 'POST #create as a normal user does not create, redirects to user show page' do
    login_user
    it 'does not save the new supply in the database' do
      @student_class = FactoryGirl.create(:student_class)
      expect{
        post :create, supply: FactoryGirl.attributes_for(:supply, student_class_id: @student_class.id)
      }.to_not change(Supply, :count)
      expect(response).to redirect_to("/users/#{subject.current_user.id}")
    end
  end

  describe 'PATCH #update as an admin user' do
    login_admin

    before :each do
      @supply = FactoryGirl.create(:supply)
    end

    it 'updates the supply in the database' do
      patch :update, id: @supply, supply: FactoryGirl.attributes_for(:supply, name: "Edited Supply")
      @supply.reload
      expect(@supply.name).to eq("Edited Supply")
    end

    it 'redirects to supplies#show' do
      patch :update, id: @supply, supply: FactoryGirl.attributes_for(:supply, name: "Edited Supply")
      expect(response).to redirect_to @supply
    end
  end

  describe 'PATCH #update as a normal user does not update, redirects to user show page' do
    login_user

    before :each do
      @supply = FactoryGirl.create(:supply)
    end
    
    it 'does not update supply in the database' do
      patch :update, id: @supply, supply: FactoryGirl.attributes_for(:supply, name: 'Edited Supply')
      @supply.reload
      expect(@supply.name).to_not eq("Edited Supply")
    end

    it 'redirects the user to the user\'s show page' do
      patch :update, id: @supply, supply: FactoryGirl.attributes_for(:supply, name: 'Edited Supply')
      expect(response).to redirect_to("/users/#{subject.current_user.id}")
    end
  end

  describe 'DELETE #destroy as an admin user' do
    login_admin
    before :each do 
      @supply = FactoryGirl.create(:supply)
    end
    it 'deletes the supply from the database' do
      expect{
        delete :destroy, id: @supply
      }.to change(Supply, :count).by(-1)
    end
    it 'redirects to supplies#index' do
      delete :destroy, id: @supply
      expect(response).to redirect_to supplies_url
    end
  end

  describe 'DELETE #destroy as a normal user' do
    login_user
    before :each do
      @supply = FactoryGirl.create(:supply)
    end
    it 'does not delete the supply from the database' do
      expect{
        delete :destroy, id: @supply
      }.to_not change(Supply, :count)
    end
    it 'redirects to the user\'s show page' do
      delete :destroy, id: @supply
      expect(response).to redirect_to("/users/#{subject.current_user.id}")
    end
  end
end

