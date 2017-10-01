class User < ActiveRecord::Base
  def self.create_user!(userHash)
      userHash[:session_token] = SecureRandom.base64
      create!(userHash)
  end
end
