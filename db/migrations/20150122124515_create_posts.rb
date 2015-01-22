class CreatePosts < Sequel::Migration
  def up
    create_table :posts do
      primary_key :id
      String :title
      String :content
      Integer :user_id
      index :user_id
    end
  end

  def down
    drop_table :posts
  end
end
