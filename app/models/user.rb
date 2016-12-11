class User < ApplicationRecord
  def self.create_with_wechat(auth)
    create! do |user|
      user.uid = auth['uid']
      if auth['info']
        user.nickname = auth['info']['nickname'] || ''
        user.avatar = auth['info']['headimgurl']
        user.sex = auth['info']['sex']
      end
    end
  end

  def update_user_info(auth)
    if auth['info']
      user_info = {
          'nickname' => auth['info']['nickname'],
          'avatar'=>auth['info']['headimgurl'],
          'sex'=>auth['info']['sex']
      }
      update(user_info)
    end
  end
end
