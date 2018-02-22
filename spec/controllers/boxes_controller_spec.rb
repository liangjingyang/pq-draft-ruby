require 'rails_helper'

RSpec.describe BoxesController, type: :controller do

  let(:user) { User.create!(name: '223', uid: '123') }
  let(:token) { (Knock::AuthToken.new payload: user.to_token_payload).token }
  let(:box) { user.box }
  before { Rails.cache.write(CACHE_JWT(user.id), token, expires_in: 12.minutes) }

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
      old_token = box.qrcode_token
      @request.headers['Content-Type'] = 'application/json'
      post :generate_qrcode_token, params: {token: token, box_id: box.id}, format: :json
      expect(response).to have_http_status(:success)
      box.reload
      LOG_DEBUG(response.body)
      expect(JSON.parse(response.body)['data']['qrcode_token']).to eq(box.qrcode_token)
      expect(box.qrcode_token).not_to eq(old_token)
    end
  end

  describe "GET #following_boxes" do
    it "returns http success" do
      get :following_boxes, params: {token: token, page: 1}, format: :json
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['data']).to be_empty
    end
  end

end
