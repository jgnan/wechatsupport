require 'digest/sha1'
module Wechat
  module WechatHelper
    #
    # Hash wechat message's params to sha1, according to wechat's standard.
    # We'll just join the nonce, timestamp and our access_token to use sha1 algorithm to do it
    def hash_message_params(nonce,timestamp)
      Digest::SHA1.hexdigest Wechat.access_token + timestamp + nonce       
    end

    #
    # Verify whether a message request is validated.
    # If true the echostr will be return, or false if not
    def verify_message_params(signature,timestamp, nonce, echostr)
      hash_message_params(timestamp,nonce) == signature ? echostr : false
    end
  end
end
