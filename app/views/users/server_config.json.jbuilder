json.data do
  json.add_counter_interval @server_config.add_counter_interval
  json.add_counter_max_count @server_config.add_counter_max_count
  json.ads_counter_pay_interval @server_config.ads_counter_pay_interval
  json.notice @server_config.notice
end