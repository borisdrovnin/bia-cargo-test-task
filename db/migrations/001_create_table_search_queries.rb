Sequel.migration do
  up do
    create_table(:search_queries) do
      primary_key :id
      Time :created_at
      Float :length
      Float :width
      Float :height
      Float :total_weight
      Float :total_volume
      Float :price
      String :city_name_from
      String :city_name_to
    end
  end

  down do
    drop_table(:search_queries)
  end
end
