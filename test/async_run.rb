require File.expand_path(File.dirname(__FILE__)) + "/helper.rb"

class Polling::Test < Test::Unit::TestCase
  def test_async
    Polling.setting offset: 5
    Polling.__send__("async_run","5s") do
      puts "exec sleep 2" 
      sleep 2             
      puts Time.now       
    end                   
  end
end
