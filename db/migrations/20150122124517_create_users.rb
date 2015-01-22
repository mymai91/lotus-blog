class CreateUsers < Sequel::Migration
  def up
    create_table :users do
      primary_key :id
      String :email
      String :first_name
      String :last_name
      String :password_salt
      String :password_hash
    end
  end

  def down
    drop_table :users
  end
end
