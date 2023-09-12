Sequel.migration do
  up do
    create_table(:endpoints) do
      primary_key :id
      String :verb, null: false
      String :path, null: false
    end
  end

  down do
    drop_table(:endpoints)
  end
end
