module Helpers
  def fixtures_path(file_name)
    File.dirname(__FILE__) + "/fixtures/#{file_name}"
  end
end