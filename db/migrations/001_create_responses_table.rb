Sequel.migration do
  up do
    create_table(:responses) do
      primary_key :id
      Integer :code, null: false
      String :headers
      String :body
    end
  end

  down do
    drop_table(:responses)
  end
end
