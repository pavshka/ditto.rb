Sequel.migration do
  up do
    alter_table(:endpoints) do
      # Verb and path should be unique together
      add_index %i[verb path], unique: true
    end
  end

  down do
    alter_table(:endpoints) do
      drop_index %i[verb path]
    end
  end
end
