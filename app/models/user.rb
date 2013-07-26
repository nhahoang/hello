class User < ActiveRecord::Base
  require 'digest/md5'
  attr_accessible :fullname, :password_digest, :role, :username
  validates :fullname, :password_digest, :username, presence: true

  def hash_pass
    self.password_digest = Digest::MD5.hexdigest(self.password_digest)
  end

  def self.authenticate(username, password)
    password = Digest::MD5.hexdigest(password)
    return @user = self.find_by_username_and_password_digest(username,password)
  end

  def is_admin
    if self.role == 1
      return true
    else
      return false
    end
  end
end
