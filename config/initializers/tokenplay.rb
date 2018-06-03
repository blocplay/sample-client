TokenPlay.configure do |config|
  config.access_key = ENV['tokenplay_ACCESS_KEY']
  config.secret_key = ENV['tokenplay_SECRET_KEY']
  config.base_url   = ENV['tokenplay_WALLET_URL']
  config.logger     = Rails.logger
end
