class User < ActiveRecord::Base
  def create_user!(userHash)
      userHash[:session_token] = SecureRandom.base64
      self.create!(userHash)
  end
end
