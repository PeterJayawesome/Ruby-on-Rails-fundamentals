require 'rails_helper'

RSpec.describe MessagesController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      User.create(username:"Peter")
      session[:user_id] = 1
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
