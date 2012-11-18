require 'polling/version'
require 'polling/confirm'
require 'polling/sleep'
require 'polling/target'

module Polling
  module_function
  def run(arr, debug=false)
    start = true
    arr = Confirm::check_arr(arr)
    loop do 
      arr.each do |time|
        time = Confirm::check_value(time)
        Sleep::exec Target::interval(0, debug) if start
        start = false
        Sleep::exec Target::interval(time, debug) unless start
        yield
      end
    end
  end
end
