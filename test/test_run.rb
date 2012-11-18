require File.expand_path(File.dirname(__FILE__)) + "/helper.rb"

class PollingTest < Test::Unit::TestCase
  def test_run
    puts "start: #{Time.now}"
    arr = [5,15,25,35,45,55]
    Polling::run(arr,true) do
      puts Time.now
      sleep 2
    end
  end
end
