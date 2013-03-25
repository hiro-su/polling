require 'polling/engine'
require 'polling/sleep'
require 'polling/validate'
require 'polling/utils'

module Polling
  class << self
    def setting opts={}
      set_instance_variables opts
    end

    def run interval=@interval, debug=false
      @offset ||= 0
      @debug ||= debug
      e = Engine.new
      e.offset = @offset

      exec = lambda do |time|
        yield if block_given?
        e.target = e.increment! time
        Sleep.exec e.stime(:debug=>@debug)
      end

      exec_arr = lambda do |time_arr|
        time_arr.each do |time|
          e.target = e.array! time
          Sleep.exec e.stime(:debug=>@debug)
          yield if block_given?
        end
      end

      interval = Validate.value interval

      case interval
      when Array
        loop { exec_arr.call interval }
      else
        Sleep.exec e.stime(:debug=>@debug)
        loop { exec.call interval }
      end
    rescue => ex
      puts ex.message
    end

    private

    def set_instance_variables variables
      variables.each do |key,var|
        instance_variable_set "@#{key}", var
      end
    end

    alias start run
  end
end
