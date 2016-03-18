Wechat::Engine.routes.draw do
  get '/update-token' => 'verify#update_access_token'
  get '/gen-sdk-sign' => 'verify#gen_sdk_sign'
  get '/verify-signature' => 'verify#verify_signature'
end
