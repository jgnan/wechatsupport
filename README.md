微信公众API支持项目
=========
此项目用于接入公众平台的API接口

使用指南
=========
在你的GemFile中引入这个项目:
gem 'wechatsupport', git: 'https://github.com/jgnan/wechatsupport.git'

保存退出后，执行命令
bundle install

然后，在你的config/initializers目录下面添加一个wechatsupport.rb的文件，并把以下内容添加到文件内:
Rails.application.config.wechat.app_id = 'your_app_id'
Rails.application.config.wechat.app_secret = 'your_app_secret'

最后，在你的routes文件里面添加以下这句:
namespace :wechat do
  get :update_token, action: :update_access_token, controller: 'commonapi'
end

保存后可以尝试通过/wechat/update_token来检查配置是否生效
