require File.expand_path(File.dirname(__FILE__)) + "/helper.rb"

class Polling::Test < Test::Unit::TestCase
  def test_setting
    hash = {:offset=>0}
    assert_equal hash, Polling.setting(offset:0)
    hash = {:offset=>30,:debug=>true}
    assert_equal hash, Polling.setting(offset:30,debug:true)
  end
end
