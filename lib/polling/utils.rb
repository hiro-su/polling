module Polling
  class Utils
    class << self
      def convert(value)
        case value
        when /(\d+)s/
          value = $1.to_i
        when /(\d+)m/
          value = $1.to_i*60
        when /(\d+)h/
          value = $1.to_i*60*60
        when /(\d+)d/
          value = $1.to_i*60*60*24
        when String
          value = value.to_i
        end
        return value
      end
    end
  end
end
