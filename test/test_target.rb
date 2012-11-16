require File.expand_path(File.dirname(__FILE__)) + "/helper.rb"
require 'time'

class PollingTest < Test::Unit::TestCase

  def test_target_time
    Time.stubs(:now).returns(Time.parse "2012/12/31 23:59:59")
    assert_equal 1, Polling::Target::interval(0)
    assert_equal 6, Polling::Target::interval(5)
    assert_equal 0, Polling::Target::interval(59)
    assert_equal 1, Polling::Target::interval(60)
    assert_equal 2, Polling::Target::interval(61)

    arr = [0,1,5,10,20,30,40,50,58]
    arr.each do |time|
      assert_equal time+1, Polling::Target::interval(time)
    end

    Time.stubs(:now).returns(Time.parse "2012/01/01 00:00:00")
    assert_equal 180, Polling::Target::interval(180,true)
    assert_equal 300, Polling::Target::interval(300,true)
    assert_equal 300, Polling::Target::interval(300,true)
    assert_equal 3600, Polling::Target::interval(3600,true)

  end
end
