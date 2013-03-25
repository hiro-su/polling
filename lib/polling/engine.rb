#encoding: utf-8
module Polling
  class Engine
    attr_accessor :target, :offset
    def initialize
      @target = @offset = 0
      @init_time = 60
    end

    def increment! interval
      @init_time = interval if interval > 60
      @target += interval
    end

    def array! interval
      @init_time = interval if interval > 60
      @target = interval
    end

    def stime opts={}
      opts = {target: @target, init_time: @init_time}.merge opts

      case
      when target(opts[:target]) < opts[:init_time]
        stime = make_sleep(now_sec_to_f)
        stime += opts[:init_time] if opts[:target].eql? 0
      when target(opts[:target]) >= opts[:init_time]
        decrement!
        stime = make_sleep(now_sec_to_f) + opts[:init_time]
      end

      stime += @offset
      stime -= opts[:init_time] if stime > opts[:init_time]

      raise if stime < 0

      debug debug: opts[:debug], stime: stime
      stime
    rescue => ex
      puts ex.to_s
      return @init_time
    end

    private

    def target target=@target, offset=@offset
      target + offset
    end

    def now_sec_to_f init_time=@init_time
      Time.now.to_f % init_time
    end

    def make_sleep target=@target, now
      target - now
    end

    def decrement! init_time=@init_time
      @target -= init_time
    end

    def debug opts={}
      if opts[:debug]
        until_time = Time.at(Time.now.to_f + opts[:stime])
        print "sleep #{opts[:stime]}seconds (until #{until_time})\n"
      end
    end
  end
end
