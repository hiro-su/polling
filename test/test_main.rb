require File.expand_path(File.dirname(__FILE__)) + "/helper.rb"

class Polling::Test < Test::Unit::TestCase
  def test_setting
    hash = {:offset=>0}
    assert_equal hash, Polling.setting(offset:0)
    hash = {:offset=>30,:debug=>true}
    assert_equal hash, Polling.setting(offset:30,debug:true)
  end

  def test_run
    puts "start: #{Time.now}"
    Polling.setting offset: 5, debug: true
    #Polling::run [0,10,20,30,40,50] do
    Polling::run 10 do
      puts Time.now
      puts "exec sleep 2"
      sleep 2
    end
  end
end
