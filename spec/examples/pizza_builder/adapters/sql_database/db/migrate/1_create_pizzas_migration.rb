Sequel.migration do
  up do
    create_table(:pizzas) do
      primary_key :id
      String :name, :null=>false
    end
  end

  down do
    drop_table(:pizzas)
  end
end
