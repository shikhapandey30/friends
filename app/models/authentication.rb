class Authentication < ApplicationRecord
	 belongs_to :user
	 def self.from_omniauth(auth)
    authenticate = where(provider: auth['provider'], :uid=>auth['uid']).first_or_initialize
    if authenticate.user
      authenticate.provider = auth.provider
      authenticate.uid = auth.uid
      authenticate.token = auth.credentials.token
    else
      user = User.find_by_email(auth.info.email)
      unless user 
        user = User.new

          end
          authenticate.provider = auth.provider
        authenticate.uid = auth.uid
        authenticate.token = auth.credentials.token
        user.email = auth.info.email
        if auth['provider'] == "twitter"
          user.email = auth.extra.raw_info.id.to_s+"@twitter.com"
        end
        user.password =  Devise.friendly_token.first(8)
        user.save!
        authenticate.user_id = user.id
     end
    authenticate.save
    authenticate.user
  end
 #  belongs_to :user
 # def self.from_omniauth(auth)
 #    authenticate = where(provider: auth['provider'], :uid=>auth['uid']).first_or_initialize
 #    register_user = User.find_by(email: auth.info.email)
 #    if authenticate.user
 #      return authenticate.user
 #    elsif register_user
 #      register_user.authentications.create(provider: auth['provider'], :uid=>auth['uid'])
 #      return register_user
 #    else
 #      user = User.new(
 #        email: auth.info.try(:email),                      
 #        password: Devise.friendly_token.first(8)
 #      )
 #      if user.email.blank?
 #        user.email=auth.extra.raw_info.id.to_s+"@gmail.com"
 #      end
 #      user.save!(:validate => false)
 #      user.authentications.create(provider: auth['provider'], :uid=>auth['uid'],token: auth["credentials"]["token"])
 #      return user
 #   end
 #  end
end


