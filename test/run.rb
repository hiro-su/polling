require File.expand_path(File.dirname(__FILE__)) + "/helper.rb"

class Polling::Test < Test::Unit::TestCase
  def test_run
    Polling.setting offset: 5, debug: true
    #Polling::run [0,10,20,30,40,50] do
    Polling::run 5 do
      puts Time.now
      puts "exec sleep 2"
      sleep 2
    end
  end
end
