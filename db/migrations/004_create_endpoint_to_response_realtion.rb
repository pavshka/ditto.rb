Sequel.migration do
  up do
    alter_table(:responses) do
      add_foreign_key :endpoint_id, :endpoints, on_delete: :cascade
    end

    alter_table(:endpoints) do
      add_foreign_key :response_id, :responses, on_delete: :cascade
    end
  end

  down do
    drop_foreign_key :responses, :endpoint_id
    drop_foreign_key :endpoints, :response_id
  end
end
