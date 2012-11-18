require 'time'

module Polling
  module Target
    module_function

    def interval(interval,*args)
      init = 60
      now_to_f = Time.now.to_f
      stime = interval - (now_to_f % init)

      args.each do |arg|
        @start = arg[:start]
        @debug = arg[:debug]
      end

      if !@start && stime < 0
        stime = init - stime.abs
      end

      ### debug
      print "sleep #{stime}seconds (until #{Time.at(now_to_f + stime)})\n" if @debug && stime > 0
      return stime
    end

  end
end
