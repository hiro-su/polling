module Polling
  module Confirm
    module_function
    def check_value(value)
      value = value.to_i
      raise TypeError, "Please set a value that is multiple of 60." if (value % 60 != 0) && value > 60
      return value
    end

    def check_arr(arr)
      if arr.count == 1
        time = convert(arr[0])
        #arr = time < 60 ? create_arr(time) : [time]
        arr = create_arr(time)
        raise TypeError, "Please set a value that is divisible by 60." if (60 % time != 0) && time < 60
      end
      return arr
    end

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

    def create_arr(time)
      arr = Array.new
      arr << 0 if time != 0
      result = time
      if time < 60
        while time < 60
          arr << time
          time += result
        end
      else
        arr << time
      end
      return arr
    end
  end
end
