class ServerConfig
  attr_reader :add_counter_interval
  attr_reader :add_counter_max_count
  attr_reader :ads_counter_pay_interval
  attr_reader :notice

  def initialize
    @add_counter_interval = 86400
    @add_counter_max_count = 30
    @ads_counter_pay_interval = 259200
  end
end