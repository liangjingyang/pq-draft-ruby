require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "Post" do
    before do
      @user = create(:user, uid: '123', provider: 'wx', name: 'abc')
      @box = @user.box
    end

    it "Number should be present" do
      expect(@box.number).to be_present
    end
  end
end
