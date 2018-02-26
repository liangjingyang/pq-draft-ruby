class WxController < ApplicationController
  before_action :authenticate_user, except: [:notify_unified_order]

  def unified_order
    @nonce_str = random_string
    res = User.unified_order(100, request.remote_ip, @nonce_str)
    @prepay_id = res['xml']['prepay_id']
  end

  def notify_unified_order
    @ret = {'return_code' => 'SUCCESS'}.to_xml(root: 'xml', dasherize: false)
    render plain: @ret
  end

  private
  def random_string
    [('0'..'9'), ('A'..'Z')].map(&:to_a).flatten.shuffle[0, 16].join
  end

end
