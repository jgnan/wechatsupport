module Wechat
  class Railtie < Rails::Railtie
    config.wechat = Wechat::Config.new
    intializer "wechat.intialize" do |app|
      app.config.wechat
    end
  end
end
