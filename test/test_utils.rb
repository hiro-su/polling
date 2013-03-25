require File.expand_path(File.dirname(__FILE__)) + "/helper.rb"

class Polling::Utils::Test < Test::Unit::TestCase
  def test_utils_convert
    assert_equal 0, Polling::Utils.convert(0)
    assert_equal 60, Polling::Utils.convert(60)

    assert_equal 0, Polling::Utils.convert("0")
    assert_equal 60, Polling::Utils.convert("60")
    assert_equal 120, Polling::Utils.convert("120")

    assert_equal 0, Polling::Utils.convert("0s")
    assert_equal 10, Polling::Utils.convert("10s")
    assert_equal 60, Polling::Utils.convert("60s")
    assert_equal 60, Polling::Utils.convert("1m")
    assert_equal 300, Polling::Utils.convert("5m")
    assert_equal 1800, Polling::Utils.convert("30m")
    assert_equal 3600, Polling::Utils.convert("1h")
    assert_equal 18000, Polling::Utils.convert("5h")
    assert_equal 86400, Polling::Utils.convert("1d")
    assert_equal 432000, Polling::Utils.convert("5d")

    assert_equal [0], Polling::Utils.convert([0])
    assert_equal [60], Polling::Utils.convert([60])
    assert_equal [0,10,20,30,40,50], Polling::Utils.convert([0,10,20,30,40,50])
  end
end
