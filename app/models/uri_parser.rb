class UriParser
  attr_reader :user, :uri, :code, :message, :uri_type
  def initialize(user, uri)
    @user = user
    uri = uri || ''
    @uri = URI.parse(uri)
    @code = 0
  end

  def parse
    if follow_box_uri?
      parse_follow_box_uri
    end
  end

  def parse_follow_box_uri
    begin
      @uri_type = "follow_box"
      query_params = parse_params
      qrcode_token = query_params['qrcode_token']
      box = Box.find_by(qrcode_token: qrcode_token)
      if box.present?
        BoxFollower.find_or_create_by(user_id: @user.id, box_id: box.id)
        @code = 0
        @message = '订阅成功'
      else
        @code = 1
        @message = '订阅失败'
      end
    rescue
      @code = 1
      @message = '订阅失败'
    end
  end

  def follow_box_uri?
    scheme_and_host? && 
    @uri.path == '/uri/follow_box' && 
    @uri.query.present?
  end

  def parse_params
    query_params = URI.decode_www_form(@uri.query)
    Hash[query_params]
  end 

  def scheme_and_host?
    @uri.scheme == 'https' && @uri.host == DRAFT_CONFIG['server_host']
  end
end
