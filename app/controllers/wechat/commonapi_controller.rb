# coding: utf-8
class Wechat::CommonapiController < WechatController
  include Wechat::WechatHelper
  # GET /update_token
  # This method will help use to update the wechat's access token for your following openapi request immediately
  #
  def update_access_token
    render json: Wechat::Jobs.update_token 
  end


  # GET /verify_signature
  # This api will check wechat verify message when you registered this url on wechat platform.
  def verify_signature
    logger.info {"[verify_signature] We receive params -> #{params}"}
    render text: verify_signature_message(params[:signature], params[:timestamp], params[:nonce],params[:echostr])
  end
end
