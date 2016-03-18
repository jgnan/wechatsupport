class Wechat::VerifyController < WechatController
  include Wechat::WechatHelper
  # GET /update_token
  # This method will help use to update the wechat's access token for your following openapi request immediately
  #
  def update_access_token
    render json: Wechat::Jobs.update_token
  end

  #
  # GET /access-token
  # Get current access token
  #
  def access_token
    logger.debug {"[access_token] Access token is -> #{Wechat.access_token}"}
    render text: 'ok'
  end

  #
  # GET /wechat/gen-sdk-sign
  # Generate sdk signature
  #
  def sdk_sign
    source = {
        noncestr:params[:nonce],
        timestamp:params[:ts],
        jsapi_ticket:Wechat.access_token,
        url: request.original_url}
    sign = gen_sdk_sign(source)
    logger.debug {"[gen_sdk_sign] Generate signature to #{source.to_json}, signature => #{sign}"}
    render text: sign
  end

  # GET /sdk-config
  # Generate sdk config script for client
  #
  def sdk_config
    source = {
        noncestr:rand.to_s,
        timestamp:Time.new.to_i.to_s,
        jsapi_ticket:Wechat.access_token,
        url: params[:url]}
    sign = gen_sdk_sign source 
    js_apis = params[:js_apis] || ''
    js_apis = js_apis.split(',').map {|v| "'#{v}'"}.join(',')
    render text: """
      wx.config({
        appId:'#{Wechat.app_id}',
        timestamp:'#{source[:timestamp]}',
        nonceStr:'#{source[:noncestr]}',
        signature:'#{sign}',
        jsApiList:[#{js_apis}]})
    """
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
