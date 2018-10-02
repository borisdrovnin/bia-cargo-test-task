module FixturesSpecHelper
  FIXTURES_PATH = File.expand_path('../fixtures', __dir__)

  def fixture_file(filename)
    File.expand_path(filename, FIXTURES_PATH)
  end

  def fixture_json(filename)
    File.read(fixture_file("#{filename}.json"))
  end
end
