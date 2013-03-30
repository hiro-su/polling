require File.expand_path(File.dirname(__FILE__)) + "/helper.rb"

class Polling::Test < Test::Unit::TestCase
  def test_async
    Polling.async_run 5, true do
      puts "exec sleep 2" 
      sleep 2             
      puts Time.now       
    end                   
  end
end
