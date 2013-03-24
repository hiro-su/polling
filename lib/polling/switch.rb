require File.join(File.dirname(__FILE__),"utils")
module Polling
  module Switch
    def self.switch value
      case value
      when Array
        if value.size.eql? 1
          value = value[0]
        else
          value.each do |i|
          end
        end
      when String
        value = Utils.convert value
      end
      value
    end
  end
end
