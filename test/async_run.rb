require File.expand_path(File.dirname(__FILE__)) + "/helper.rb"

class Polling::Test < Test::Unit::TestCase
  def test_async
    Polling.setting debug: true, offset: 5
    Polling.async_run 5
  end
end
