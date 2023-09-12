Sequel.migration do
  up do
    add_index :responses, :endpoint_id
    add_index :endpoints, :response_id
  end

  down do
    drop_index :responses, :endpoint_id
    drop_index :endpoints, :response_id
  end
end
