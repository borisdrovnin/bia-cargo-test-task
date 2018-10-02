module CargoTask
  module Services
    SEARCH_QUERY_SCHEMA =
      {
        'description' => 'SearchQuery',
        'type' => 'object',
        'required' => %w[length width height weight volume to from],
        'properties' => {
          'length' => {
            'type' => 'number',
            'minimum' => 0
          },
          'width' => {
            'type' => 'number',
            'minimum' => 0
          },
          'height' => {
            'type' => 'number',
            'minimum' => 0
          },
          'weight' => {
            'type' => 'number',
            'minimum' => 0,
            'maximum' => 20_000
          },
          'volume' => {
            'type' => 'number',
            'minimum' => 0,
            'maximum' => 80
          },
          'to' => {
            'type' => 'string',
            'minLength' => 1
          },
          'from' => {
            'type' => 'string',
            'minLength' => 1
          }
        }
      }.freeze
  end
end
