class User < ActiveRecord::Base
  has_secure_password
  has_many :martial_art_styles
end
