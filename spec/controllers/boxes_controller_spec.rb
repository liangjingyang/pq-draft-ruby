require 'rails_helper'

RSpec.describe BoxesController, type: :controller do

  let(:user) { User.create!(name: '223', uid: '123') }
  let(:token) { (Knock::AuthToken.new payload: user.to_token_payload).token }
  let(:box) { user.box }
  before { Rails.cache.write("#{CACHE_JWT}#{user.id}", token, expires_in: 12.minutes) }

  describe "GET #index" do
    it "returns http success" do
      get :index, params: {token: token, page: 1}, format: :json
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['data'][0]['name']).to eq('223')
    end

    it "returns user unauthorized" do
      get :index, format: :json
      expect(response).to have_http_status(401)
      expect(JSON.parse(response.body)['code']).to eq(401001)
    end 
  end

  describe "POST #show" do
    it "returns http success" do
      get :show, params: {token: token, id: box.id}, format: :json
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['data']['name']).to eq('223')
    end
  end

  describe "POST #update" do
    it "returns http success" do
      @request.headers['Content-Type'] = 'application/json'
      post :update, params: {token: token, id: box.id, name: "123的草稿箱"}, format: :json
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['data']['name']).to eq("123的草稿箱")
    end
  end

  describe "GET #generate_qrcode_token" do
  it "returns http success" do
    @request.headers['Content-Type'] = 'application/json'
    get :generate_qrcode_token, params: {token: token, box_id: box.id}, format: :json
    expect(response).to have_http_status(:success)
    expect(JSON.parse(response.body)['data']['qrcode_token']).to be_present
  end
end

end
