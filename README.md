微信公众API支持项目
=========
此项目用于接入公众平台的API接口

使用指南
=========
在你的GemFile中引入这个项目:
```sh
gem 'wechatsupport', git: 'https://github.com/jgnan/wechatsupport.git'
```

保存退出后，执行命令
```sh
bundle install
```

然后，在你的config/initializers目录下面添加一个wechatsupport.rb的文件，并把以下内容添加到文件内:
```sh
Rails.application.config.wechat.app_id= 'your_app_id'
Rails.application.config.wechat.app_secret= 'your_app_secret'
```

最后，在你的routes文件里面添加以下这句:
```sh
namespace :wechat do
  get :update_token, action: :update_access_token, controller: 'commonapi'
end
```

保存后可以尝试通过/wechat/update_token来检查配置是否生效,这个接口会启动自动更新token的任务.

最后，你需要在你的服务器里面添加一个cronjob来定期调用这个接口更新你的access_token:
```sh
0 * * * * curl 'http://serverIp:port/wechat/update_token'
```

这样你服务器的token就会自动定期更新,但是一开始的时候要自己手动更新一次

验证签名
=========
在WechatHelper里面提供了一个帮助函数:verify_message_params,这个函数可以用于验证签名信息，使用方法:

```sh
include Wechat::WechatHelper

...

verify_message_params params[:signature], params[:timestamp], params[:nounce], true
```
