require 'polling/version'
require 'polling/confirm'
require 'polling/sleep'
require 'polling/target'

module Polling
  module_function
  def run(arr, debug=false)
    arr = Confirm::check_arr(arr)
    args = {:start => false, :debug => debug}
    Sleep::exec Target::interval(0,args)
    args[:start] = true
    loop do 
      arr.each do |time|
        time = Confirm::check_value(time)
        Sleep::exec Target::interval(time,args)
        args[:start] = false
        yield
      end
    end
  end
end
