require 'rails_helper'

describe UsersController do
  let!(:user) {User.create!(first_name: "Mike", last_name: "Bonetti", email: "test@email.com", password: "password")}

  describe "GET #new" do
    it "renders the :new template" do
      get(:new)
      expect(response).to render_template(:new)
    end
    describe "POST users#create" do
      it "registers a new user in the database" do
        expect{post :create, { user: {first_name: "Mike", last_name: "Bonetti", email: "testy@email.com", password: "password"} }}.to change{User.all.length}.by(1)
      end

      it "assigns the new user as @user" do
        post :create, {user: {first_name: "Mike", last_name: "Bonetti", email: "testy@email.com", password: "password"}}
        expect(assigns(:user).class).to eq User
      end

      it "redirects to days#index after registering new user" do
        post :create, {user: {first_name: "Mike", last_name: "Bonetti", email: "testy@email.com", password: "password"}}
        expect(response).to redirect_to '/days'
      end
    end
  end
end

