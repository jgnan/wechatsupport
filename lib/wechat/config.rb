module Wechat
  class Config
    class << self
      mattr_accessor :app_id
      mattr_accessor :app_secret
    end
  end
end
