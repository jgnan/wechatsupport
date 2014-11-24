require 'rest-client'
module WechatSupport
  class Jobs
    def update_token
      Rails.logger.debug {"[WechatJobs.update_token] updating wechat token"}      resp = RestClient.get "https://api.weixin.qq.com/cgi-bin/token",{params:{grant_type:'client_credential',appid:WechatSupport.app_id,secret:WechatSupport.app_secret}}
      Rails.logger.info {"[WechatJobs.update_token] response -> #{resp}"}
      json = JSON.parse resp
      WechatSupport.access_token= json['access_token']
      Rails.logger.debug {"[WechatJobs.update_token] now the access_token updated to  -> #{WechatSupport.access_token}"}
    end
  end
end
