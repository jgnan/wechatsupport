#coding : utf-8
module Wechat
  module Message
    def parse_message xml
      message = Hash.from_xml xml
    end
    class TextMessage
    end
  end
end 
