require 'uri'
require 'net/http'
require 'net/https'

module Draft
  module WX
    def get_access_token(code)
      url = "#{DRAFT_CONFIG['wx_api_endpoint']}/sns/oauth2/access_token" +
        "?appid=#{DRAFT_CONFIG['wx_app_id']}" +
        "&secret=#{DRAFT_CONFIG['wx_secret']}" +
        "&code=#{code}" +
        "&grant_type=authorization_code"
      request_get(url)
    end

    def get_user_info(access_token, open_id)
      url = "#{DRAFT_CONFIG['wx_api_endpoint']}/sns/userinfo" +
        "?access_token=#{access_token}" +
        "&openid=#{open_id}"
      request_get(url)
    end

    def request_get(url)
      uri = URI.parse(url)
      https = Net::HTTP.new(uri.host, uri.port)
      https.use_ssl = true
      https.ssl_timeout = 5
      https.read_timeout = 30
      req = Net::HTTP::Get.new(uri)
      response = https.request(req)
      if !response.present?
        raise StandardError, 'no response'
      elsif response.code != '200'
        raise StandardError, "response #{response.code}"
      end
      res = JSON.parse(response.body)
      if res['errcode'].present?
        raise StandardError, res['errmsg']
      else
        res
      end
    end
  end
end