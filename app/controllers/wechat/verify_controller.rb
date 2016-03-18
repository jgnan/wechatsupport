class Wechat::VerifyController < WechatController
  include Wechat::WechatHelper
  # GET /update_token
  # This method will help use to update the wechat's access token for your following openapi request immediately
  #
  def update_access_token
    render json: Wechat::Jobs.update_token
  end

  def gen_sdk_sign
    render text: gen_sign({noncestr:params[:nonce],timestamp:params[:ts],jsapi_ticket:Wechat.access_token,url: url})
  end


  # GET /verify_signature
  # This api will check wechat verify message when you registered this url on wechat platform.
  def verify_signature
    logger.info {"[verify_signature] We receive params -> #{params}"}
    resp = verify_signature_message(params[:signature], params[:timestamp], params[:nonce],params[:echostr])
    logger.info {"[verify_signature] response -> #{resp}" }
    render text: resp
  end 
end
