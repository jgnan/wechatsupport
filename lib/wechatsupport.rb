require 'rails'
require 'wechat/jobs'

module Wechat
  autoload :Jobs, 'wechat/jobs'
  # Application ID provided by wechat platform
  mattr_accessor :app_id
  # Application secret provided by wechat platform
  mattr_accessor :app_secret

  # this token should not be set, it should be update by a job
  mattr_accessor :access_token

  # Verify token use for wechat's server configuration verification
  mattr_accessor :verify_token
  # Signature key use for server configuration verification
  mattr_accessor :sign_key

  # Project index, which will be use when you try to use the user_info authorize interface.
  mattr_accessor :index
  # By setting parent controller like this , you can adjust our controller to extends a new one.
  mattr_accessor :parent_controller
  @@parent_controller = "ApplicationController"

  def self.setup
    Wechat.cgi_base='https://api.weixin.qq.com/cgi-bin'
    yield self
  end
end

require 'wechat/rails'
