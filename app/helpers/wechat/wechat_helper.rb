require 'digest/sha1'
module Wechat
  module WechatHelper
    #
    # Hash wechat message's params to sha1, according to wechat's standard.
    # We'll just join the nonce, timestamp and our access_token to use sha1 algorithm to do it
    def hash_message_params(nonce,timestamp)
      logger.info {"[hash_message_params] verify_token:#{Wechat.verify_token}, timestamp: #{timestamp}, nonce: #{nonce}"}
      encoded = [Wechat.verify_token, timestamp,nonce].sort.join
      Digest::SHA1.hexdigest encoded
    end

    #
    # Verify whether a message request is validated.
    # If true the echostr will be return, or false if not
    def verify_signature_message(signature,timestamp, nonce, echostr)
      hash_message_params(nonce,timestamp) == signature ? echostr : false
    end

    #
    # Generate sdk signature
    #
    def gen_sdk_sign opts={}
      Digest::SHA1.hexdigest opts.sort_by {|_,v| v}
                            .map {|k,v| "#{k}=#{v}"}
                            .join('&')
    end
  end
end
