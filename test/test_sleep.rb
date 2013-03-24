require File.expand_path(File.dirname(__FILE__)) + "/helper.rb"

class PollingTest < Test::Unit::TestCase
  def test_sleep
    assert_equal false, Polling::Sleep.exec(-1)
    assert_equal false, Polling::Sleep.exec(0)
    assert_equal 1, Polling::Sleep.exec(1)
  end
end
