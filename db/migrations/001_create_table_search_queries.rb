Sequel.migration do
  up do
    create_table(:search_queries) do
      primary_key :id
      Time :created_at
      Float :length
      Float :width
      Float :height
      Float :weight
      Float :volume
      Float :distance
      Float :price
      String :from
      String :to
    end
  end

  down do
    drop_table(:search_queries)
  end
end
