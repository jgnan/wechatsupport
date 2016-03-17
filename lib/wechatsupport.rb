require 'rails'
require 'wechat/jobs'

module Wechat
  autoload :Jobs, 'wechat/jobs'
  mattr_accessor :app_id
  mattr_accessor :app_secret
  # this token should not be set, it should be update by a job
  mattr_accessor :access_token
  mattr_accessor :verify_token
  mattr_accessor :sign_key
  mattr_accessor :cgi_base
  # By setting parent controller like this , you can adjust our controller to extends a new one.
  mattr_accessor :parent_controller
  @@parent_controller = "ApplicationController"

  def self.setup
    Wechat.cgi_base='https://api.weixin.qq.com/cgi-bin'
    yield self
  end
end

require 'wechat/rails'
