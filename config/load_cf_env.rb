require 'json'

begin
  vcap = JSON.parse(ENV["VCAP_SERVICES"])

  ENV["DISCOURSE_REDIS_PASSWORD"] = vcap["redis28-swarm"][0]["credentials"]["password"]
  ENV["DISCOURSE_REDIS_PORT"]     = vcap["redis28-swarm"][0]["credentials"]["port"]
  ENV["DISCOURSE_REDIS_HOST"]     = vcap["redis28-swarm"][0]["credentials"]["hostname"]

  ENV["REDIS_URL"] = "redis://dummy:#{ENV["DISCOURSE_REDIS_PASSWORD"]}@#{ENV["DISCOURSE_REDIS_HOST"]}:#{ENV["DISCOURSE_REDIS_PORT"]}"

  ENV["DISCOURSE_SMTP_DOMAIN"]    = vcap["user-provided"][0]["credentials"]["smtp_domain"]
  ENV["DISCOURSE_SMTP_PASSWORD"]  = vcap["user-provided"][0]["credentials"]["smtp_password"]
  ENV["DISCOURSE_SMTP_USER_NAME"] = vcap["user-provided"][0]["credentials"]["stmp_user_name"]
rescue
  puts "Error loading env vars"
end
