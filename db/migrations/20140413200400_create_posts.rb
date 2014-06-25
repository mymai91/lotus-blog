Sequel.migration do
  change do
    create_table(:rooms) do
      primary_key :id
      String :title, null: false
      String :body, text: true
    end
  end
end
