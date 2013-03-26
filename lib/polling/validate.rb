require File.join(File.dirname(__FILE__),"utils")
module Polling
  module Validate
    def self.value value
      case value
      when Array
        if value.size.eql? 1
          value = value[0]
          if value.class == String
            value = Utils.convert value
          end
        else
          value = value.map {|i| i.to_f}
        end
      when String
        value = Utils.convert value
      end
      value
    end
  end
end
