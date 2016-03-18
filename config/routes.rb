Wechat::Engine.routes.draw do
  get '/update-token' => 'verify#update_access_token'
  get '/access-token' => 'verify#access_token'
  get '/sdk-sign' => 'verify#sdk_sign'
  get '/sdk-config' => 'verify#sdk_config'
  get '/verify-signature' => 'verify#verify_signature'
end
