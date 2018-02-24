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

    def unified_order(fee_in_cent, ip)
      url = "#{DRAFT_CONFIG['wx_pay_api_endpoint']}/pay/unifiedorder"
      nonce_str = random_string
      body = {
        'appid' => DRAFT_CONFIG['wx_app_id'],
        'mch_id' => DRAFT_CONFIG['wx_mch_id'],
        'nonce_str' => nonce_str,
        'body' => '微商产品册-打赏',
        'out_trade_no' => "#{Time.now.to_i}-#{nonce_str}",
        'total_fee' => fee_in_cent,
        'spbill_create_ip' => ip,
        'notify_url' => "https://#{DRAFT_CONFIG['server_host']}#{DRAFT_CONFIG['wx_pay_notify_path']}",
        'trade_type' => 'APP'
      }
      body['sign'] = sign(body)
      puts body
      request_post_xml(url, body)
    end

    def random_string
      [('0'..'9'), ('A'..'Z')].map(&:to_a).flatten.shuffle[0, 16].join
    end

    def sign(h)
      h = h.sort.to_h
      s = []
      h.each do |key, value|
        s << "#{key}=#{value}"
      end
      s = "#{s.join('&')}&key=#{DRAFT_CONFIG['wx_pay_secret']}"
      puts s
      md5 = Digest::MD5.hexdigest s
      md5.upcase
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

    def request_post_xml(url, body)
      uri = URI.parse(url)
      https = Net::HTTP.new(uri.host, uri.port)
      https.use_ssl = true
      https.ssl_timeout = 5
      https.read_timeout = 30
      req = Net::HTTP::Post.new(uri)
      req.body = body.to_xml(root: 'xml', dasherize: false)
      puts req.body
      response = https.request(req)
      if !response.present?
        raise StandardError, 'no response'
      elsif response.code != '200'
        raise StandardError, "response #{response.code}"
      end
      res = Hash.from_xml(response.body)
      if res['xml']['result_code'] == 'FAIL'
        raise StandardError, res['xml']['err_code_des']
      else
        res
      end
    end
  end
end