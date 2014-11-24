require 'rails'

module WechatSupport
  mattr_accessor :app_id
  mattr_accessor :app_secret
  # this token should not be set, it should be update by a job
  mattr_accessor :access_token
  def self.setup
    yield self
  end
end
