require 'lotus/entity'
require 'bcrypt'

class User
  include Lotus::Entity
  attributes :first_name, :last_name, :email, :password_hash, :password_salt
  attr_reader :password

  def password=(password)
    @password = password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end

  def full_name
    [first_name, last_name].join(" ")
  end
end
