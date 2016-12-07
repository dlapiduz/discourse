require 'json'

begin
  vcap = JSON.parse(ENV["VCAP_SERVICES"])

  ENV["DISCOURSE_REDIS_PASSWORD"] = vcap["redis28"][0]["credentials"]["password"]
  ENV["DISCOURSE_REDIS_PORT"]     = vcap["redis28"][0]["credentials"]["port"]
  ENV["DISCOURSE_REDIS_HOST"]     = vcap["redis28"][0]["credentials"]["hostname"]

  ENV["REDIS_URL"] = "redis://dummy:#{ENV["DISCOURSE_REDIS_PASSWORD"]}@#{ENV["DISCOURSE_REDIS_HOST"]}:#{ENV["DISCOURSE_REDIS_PORT"]}"
rescue
  puts "Error loading env vars"
end
