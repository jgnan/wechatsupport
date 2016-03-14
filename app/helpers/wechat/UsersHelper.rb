module Wechat::UsersHelper
  #
  # Get fans from wechat
  # Params:
  # ===========
  # openid - the next openid to get users from
  #
  # Response:
  # ===========
  # total - Total user we get
  # count - User count we fetch from current transcation 
  # data - Openid list(array)
  # next_openid - next openid you should pass to this method if 
  #               you want next page of open ids from the list
  #
  def user_list openid=nil
    query = {access_token: Wechat.access_token}
    query[:next_openid] = params[:openid] if openid
    RestClient.get Wechat.cgi_base+'/user/get', {params: query}
  end


  #
  # Get user info by its openid
  # Params:
  # ==========
  # openid - One or more openid to a wechat user
  #
  # Response:
  # ==========
  # subscribe - Check whether this user has subscribed your public account
  # openid - The openid to this user
  # nickname - Nick name of the user
  # sex - Gender to this user
  # city - City of this user
  # country - Country of this user
  # province - Province this user lived
  # language - zh_CN
  # headimgurl - Avatar to this user
  # subscribe_time - User subscribe time
  # unionid - Unionid
  # remark - User remark given by you
  # groupid - Groupid created by public account's admin
  #
  def user_info *openid
    return nil if openid.empty?
    if openid.size == 1
      RestClient.get Wechat.cgi_base+'/user/info', {params:
          {access_token: Wechat.access_token,openid: openid, lang: 'zh_CN'}}
    else
      post_data = {user_list:[]}
      openid.each do |id|
        post_data[:user_list] << {openid: id, lang: 'zh_CN'}
      end
      RestClient.post Wechat.cgi_base+'/user/info?access_token='+Wechat.access_token, post_data
    end
  end
end
