class WxController < ApplicationController
  before_action :authenticate_user, except: [:notify_unified_order]

  def unified_order
    res = User.unified_order(100, request.remote_ip)
    @prepay_id = res['xml']['prepay_id']
  end

  def notify_unified_order
    @ret = {'return_code' => 'SUCCESS'}.to_xml(root: 'xml', dasherize: false)
    render plain: @ret
  end

end
