Wechat::Engine.routes.draw do
  get '/update-token' => 'commonapi#update_access_token'
  get '/verify-signature' => 'commonapi#verify_signature'
end
