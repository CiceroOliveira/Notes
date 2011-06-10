require 'openid/store/filesystem'
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
  provider :open_id, OpenID::Store::Filesystem.new('/tmp')
  
  #provider :twitter, 'us2z9AseWlatBftJkadylQ', 'dgMTnsVACkueXQ5yPuO08cgUhRYqKRLiWO4dD6fR6I'
  #provider :facebook, '5921fe5101d2c6aaadfedb267ea5af7d', 'd46167bbdcbdd633eaf30218c6007f12'
  #provider :github, '4baf999c2bf75402a0ba', '217dfb86ea832898990ca395846d4fdbbe7b32bc'
  #provider :open_id, OpenID::Store::Filesystem.new('/tmp')
end