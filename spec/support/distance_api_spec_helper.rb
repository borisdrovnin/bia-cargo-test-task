module DistanceAPISpecHelper
  # stubs request to distance api with fixture file
  def distance_api_response(from, to, fixture)
    distance_api_stub(from, to, fixture_json(fixture))
  end

  # stubs request to distance api with body
  def distance_api_stub(from, to, body)
    stub_request(:get, CargoTask::Services::Distance::URL)
      .with(
        query: {
          destinations: to,
          key: 'test_key',
          language: 'ru',
          origins: from,
          region: 'ru'
        }
      ).to_return(status: 200, body: body, headers: {})
  end
end
