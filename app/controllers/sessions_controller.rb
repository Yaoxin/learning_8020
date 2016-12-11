class SessionsController < ApplicationController
  def create
    auth = request.env['omniauth.auth']
    uid = auth['uid']
    user = User.where(uid: uid.to_s).first
    if user.present?
      user.update_user_info(auth)
    else
      user = User.create_with_wechat(auth)
    end
  end
end
