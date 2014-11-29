# coding: utf-8
class Wechat::CommonapiController < WechatController
  # GET /update_token
  # This method will help use to update the wechat's access token for your following openapi request immediately
  #
  def update_access_token
    render json: Wechat::Jobs.update_token 
  end
end
