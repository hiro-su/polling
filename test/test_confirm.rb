require File.expand_path(File.dirname(__FILE__)) + "/helper.rb"

class PollingTest < Test::Unit::TestCase
  #def test_check_value
  #  assert_equal 0, Polling::Confirm::check_value(0)
  #  assert_equal 0, Polling::Confirm::check_value("0")
  #  assert_equal 60, Polling::Confirm::check_value(60)
  #  assert_equal 5, Polling::Confirm::check_value("5")
  #end

  #def test_convert
  #  assert_equal 5, Polling::Confirm::convert(5)
  #  assert_equal 5, Polling::Confirm::convert("5")
  #  assert_equal 5, Polling::Confirm::convert("5s")
  #  assert_equal 300, Polling::Confirm::convert("5m")
  #  assert_equal 18000, Polling::Confirm::convert("5h")
  #end

  #def test_check_arr
  #  assert_equal ["0","10","20","30","40","50"], Polling::Confirm::check_arr(["0","10","20","30","40","50"])
  #  assert_equal [0,10,20,30,40,50], Polling::Confirm::check_arr([0,10,20,30,40,50])
  #  assert_equal [0,10,20,30,40,50], Polling::Confirm::check_arr(["10s"])
  #  assert_equal [60], Polling::Confirm::check_arr(["1m"])
  #  assert_equal [120], Polling::Confirm::check_arr(["2m"])
  #  assert_equal [1800], Polling::Confirm::check_arr(["30m"])
  #  assert_equal [0,10,20,30,40,50], Polling::Confirm::check_arr(["10"])
  #  assert_equal [0,10,20,30,40,50], Polling::Confirm::check_arr([10])
  #  assert_equal [0,30], Polling::Confirm::check_arr([30])
  #  assert_equal [60], Polling::Confirm::check_arr([60])
  #  assert_equal [60], Polling::Confirm::check_arr(["60"])
  #  assert_equal [60], Polling::Confirm::check_arr(["60s"])
  #  assert_equal [120], Polling::Confirm::check_arr(["120s"])
  #end
end
