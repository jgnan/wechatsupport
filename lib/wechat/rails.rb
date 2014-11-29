module Wechat
  class Engine < ::Rails::Engine
    config.wechat =  Wechat
    isolate_namespace Wechat
  end
end
