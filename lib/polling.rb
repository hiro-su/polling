require 'polling/engine'
require 'polling/sleep'
require 'polling/switch'
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
      interval = Switch.switch interval

      #initialize
      Sleep.exec e.stime(:debug=>@debug)

      loop do
        yield if block_given?
        e.target = e.increment! interval
        Sleep.exec e.stime(:debug=>@debug)
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
