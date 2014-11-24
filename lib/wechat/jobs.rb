require 'rest-client'
module Wechat
  class Jobs
    def self.update_token
      Rails.logger.debug {"[WechatJobs.update_token] updating wechat token"}
      resp = RestClient.get "https://api.weixin.qq.com/cgi-bin/token",{params:{grant_type:'client_credential',appid:Wechat.app_id,secret:Wechat.app_secret}}
      Rails.logger.info {"[WechatJobs.update_token] response -> #{resp}"}
      json = JSON.parse resp
      Wechat.access_token= json['access_token']
      Rails.logger.debug {"[WechatJobs.update_token] now the access_token updated to  -> #{Wechat.access_token}"}
    end
  end
end
