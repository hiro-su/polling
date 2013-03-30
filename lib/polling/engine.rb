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

    def substitution! interval
      @init_time = interval if interval > 60
      @target = interval
    end

    def stime opts={}
      opts = {target: @target, init_time: @init_time}.merge opts

      case
      when target(opts[:target]) < opts[:init_time]
        stime = make_sleep(opts[:target],now_sec_to_f)
        stime += opts[:init_time] if opts[:target].eql? 0
      when target(opts[:target]) >= opts[:init_time]
        decrement!
        stime = make_sleep(opts[:target],now_sec_to_f) + opts[:init_time]
      end

      stime += @offset
      stime -= opts[:init_time] if stime > opts[:init_time]

      if stime < 0
        stime = opts[:init_time] - stime.abs
      end

      debug debug: opts[:debug], stime: stime
      stime
    rescue => ex
      $stderr.puts ex.to_s
      return opts[:init_time]
    end

    def stime_async opts={}
      stime = opts[:interval] - (opts[:after] - opts[:before])
      debug debug: opts[:debug], stime: stime
      stime
    rescue => ex
      $stderr.puts ex.to_s
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

    def start_print stime
      until_time = Time.at(Time.now.to_f + stime)
      $stdout.print "start: #{until_time}\n"
    end

    def debug opts={}
      if opts[:debug]
        until_time = Time.at(Time.now.to_f + opts[:stime])
        $stdout.print "sleep #{opts[:stime]}seconds (until #{until_time})\n"
      end
    end
  end
end
