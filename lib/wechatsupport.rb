require 'rails'
require 'wechat/jobs'

module Wechat
  autoload :Jobs, 'wechat/jobs'
  mattr_accessor :app_id
  mattr_accessor :app_secret
  # this token should not be set, it should be update by a job
  mattr_accessor :access_token
  # By setting parent controller like this , you can adjust our controller to extends a new one.
  mattr_accessor :parent_controller
  @@parent_controller = "ApplicationController"

  def self.setup
    yield self
  end
end

require 'wechat/rails'
