require File.expand_path(File.dirname(__FILE__)) + "/helper.rb"

class PollingTest < Test::Unit::TestCase
  def test_run
    arr = [0,10,20,30,40,50]
    Polling::run(arr,true) do
      puts "test"
      sleep 2
    end
  end
end
