require 'rails_helper'

describe AdminsController do
	let!(:admin) {User.create!(first_name: "Mike", last_name: "Bonetti", email: "test@email.com", password: "password")}
	describe "GET # new" do
		it "renders the :new template" do
			get :new
			expect(response).to render_template(:new)
		end
	end

	describe "POST admins#create" do
		it "registers a new admin in the database" do
			expect{post :create, { admin: {first_name: "Mike", last_name: "Bonetti", email: "testy@email.com", password: "password"} }}.to change{User.all.length}.by(1)
		end

		it "redirects to days#index after registering new user" do
			post :create, {admin: {first_name: "Mike", last_name: "Bonetti", email: "testy@email.com", password: "password"}}
			expect(response).to redirect_to '/days#index'
		end

		it "Makes the user is_admin? true" do
			post :create, {admin: {first_name: "Mike", last_name: "Bonetti", email: "testy@email.com", password: "password"}}
			admin = User.last
			expect(admin.is_admin).to be true
		end
	end

	describe "Error handles misssing fields" do
		it "renders NEW if submit invaild" do
			post :create, {admin: {first_name: "Mike", last_name: "Bonetti", email: "testy@email.com", password: ""}}
			expect(response).to render_template('new')
		end
	end


end