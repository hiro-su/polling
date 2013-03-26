require File.expand_path(File.dirname(__FILE__)) + "/helper.rb"

class Polling::Validate::Test < Test::Unit::TestCase
  def test_validate_value
    assert_equal 0, Polling::Validate.value(0)
    assert_equal 60, Polling::Validate.value(60)

    assert_equal 0, Polling::Validate.value("0")
    assert_equal 60, Polling::Validate.value("60")
    assert_equal 120, Polling::Validate.value("120")

    assert_equal 0, Polling::Validate.value("0s")
    assert_equal 10, Polling::Validate.value("10s")
    assert_equal 60, Polling::Validate.value("60s")
    assert_equal 60, Polling::Validate.value("1m")
    assert_equal 300, Polling::Validate.value("5m")
    assert_equal 1800, Polling::Validate.value("30m")
    assert_equal 3600, Polling::Validate.value("1h")
    assert_equal 18000, Polling::Validate.value("5h")
    assert_equal 86400, Polling::Validate.value("1d")
    assert_equal 432000, Polling::Validate.value("5d")

    assert_equal 0, Polling::Validate.value([0])
    assert_equal 60, Polling::Validate.value([60])
    assert_equal [0,10,20,30,40,50], Polling::Validate.value([0,10,20,30,40,50])
    assert_equal [0,10,20,30,40,50], Polling::Validate.value(["0","10","20","30","40","50"])

    assert_equal 0, Polling::Validate.value(["0"])
    assert_equal 60, Polling::Validate.value(["60"])
    assert_equal 10, Polling::Validate.value(["10s"])
    assert_equal 60, Polling::Validate.value(["60s"])
    assert_equal 60, Polling::Validate.value(["1m"])
  end
end
