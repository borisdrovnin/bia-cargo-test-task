RSpec.describe CargoTask::Services::Statistics do
  it 'returns top 3 queries' do
    create_list(:search_query, 8, from: 'b')
    create_list(:search_query, 5)
    create_list(:search_query, 10, from: 'a')
    create_list(:search_query, 5, from: 'c')
    result = CargoTask::Services::Statistics.top_origins(3)
    expect(result.count).to eq(3)
    expect(result.first[:from]).to eq('a')
    expect(result.first[:count]).to eq(10)
  end
end
