require 'rails_helper'

describe SessionsController do
  describe "POST session#create" do
    let!(:user) {User.create!(first_name: "Mike", last_name: "Bonetti", email: "test@email.com", password: "password")}
    it "redirects to 'days#index' if vailid login" do
      post :create, {params: {session: {email: "test@email.com", password: "password"}}}
      expect(response).to redirect_to '/days'
    end

    it "sets the session id if succesful login" do
      post :create, {params: {session: {email: "test@email.com", password: "password"}}}
      expect(session[:user_id]).to be user.id
    end

    it "renders new page if invailid " do
      post :create, {params: {session: {email: "test@email.com", password: "false-password"}}}
      expect(response).to render_template("users/new")
    end
  end
  describe "Delete session" do
    let!(:user) {User.create!(first_name: "Mike", last_name: "Bonetti", email: "test@email.com", password: "password")}

    it "destroys session if log out" do
      post :create, {params: {session: {email: "test@email.com", password: "password"}}}

      session.destroy
      expect(session[:user_id]).to be nil
    end
  end

end
