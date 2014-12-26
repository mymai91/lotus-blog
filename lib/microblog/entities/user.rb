class User
  include Lotus::Entity
  attributes :first_name, :last_name, :email

  def full_name
    [first_name, last_name].join(" ")
  end
end
