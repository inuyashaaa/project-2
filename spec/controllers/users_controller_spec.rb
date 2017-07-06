require "rails_helper"

RSpec.describe UsersController, type: :controller do
  let!(:user){FactoryGirl.create :user, is_admin: true}
  let!(:user1){FactoryGirl.create :user, is_admin: false}

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template "index"
    end
  end

  before :each do
    sign_in user
  end

  describe "DELETE #destroy" do
    it "delete a user successfully" do
      expect do
        delete :destroy, params: {id: user1.id}, xhr: true
      end
        .to change(User, :count).by -1
    end
  end
end
