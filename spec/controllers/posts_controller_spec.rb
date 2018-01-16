require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  let(:user) { User.create!(name: '223', uid: '123') }
  let(:token) { (Knock::AuthToken.new payload: user.to_token_payload).token }
  let(:box) { user.box }
  let!(:the_post) { box.posts.create!(content: "test", images: ["aaa", "bbb"]) }
  before { Rails.cache.write("#{CACHE_JWT}#{user.id}", token, expires_in: 12.minutes) }

  describe "GET #index" do
    it "returns http success" do
      get :index, params: {box_id: box.id, token: token, page: 1}, format: :json
      expect(response).to have_http_status(:success)
      LOG_DEBUG(response.body)
      expect(JSON.parse(response.body)['posts'][0]['content']).to eq('test')
    end

    it "returns user unauthorized" do
      get :index, params: {box_id: box.id, page: 1}, format: :json
      expect(response).to have_http_status(401)
      expect(JSON.parse(response.body)['code']).to eq(401001)
    end 
  end

  # describe "POST #show" do
  #   it "returns http success" do
  #     get :show, params: {box_id: box.id, token: token, id: the_post.id}, format: :json
  #     expect(response).to have_http_status(:success)
  #     expect(JSON.parse(response.body)['content']).to eq('test')
  #   end
  # end

  describe "POST #update" do
    it "returns http success" do
      @request.headers['Content-Type'] = 'application/json'
      post :update, params: {box_id: box.id, token: token, id: the_post.id, post: {content: "test2"}}, format: :json
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['content']).to eq("test2")
    end

    it "returns http success" do
      @request.headers['Content-Type'] = 'application/json'
      post :update, params: {box_id: box.id, token: token, id: the_post.id, post: {images: ["ccc"]}}, format: :json
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['images'][0]).to eq("ccc")
    end
  end

end
