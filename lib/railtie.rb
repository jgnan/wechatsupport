module WechatSupport
  class Railtie < Rails::Railtie
    config.wechat = WechatSupport::Config.new
    intializer "wechat.intialize" do |app|
      app.config.wechat
    end
  end
end
