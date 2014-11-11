# Polling

ruby polling library

## Installation

Add this line to your application's Gemfile:

    gem 'polling'

Or install it yourself as:

    $ gem install polling

## Usage

New Interface

    require 'polling'
    Polling.start 10 do
      puts "test"
      sleep 2
    end

result

    #[debug]=> start: 2012-11-16 19:47:36 +0900
    #[debug]=> sleep 23.980872869491577seconds (until 2012-11-16 19:48:00 +0900)
    test
    #[debug]=> sleep 7.999034881591797seconds (until 2012-11-16 19:48:10 +0900)
    test
    #[debug]=> sleep 7.999000072479248seconds (until 2012-11-16 19:48:20 +0900)
    test
    #[debug]=> sleep 7.998318195343018seconds (until 2012-11-16 19:48:30 +0900)
    test
    #[debug]=> sleep 7.998938083648682seconds (until 2012-11-16 19:48:40 +0900)
    test
    #[debug]=> sleep 7.999677896499634seconds (until 2012-11-16 19:48:50 +0900)
    test
    #[debug]=> sleep 7.998055934906006seconds (until 2012-11-16 19:49:00 +0900)
    test
    #[debug]=> sleep 7.998072147369385seconds (until 2012-11-16 19:49:10 +0900)

set offset

    require 'polling'
    Polling.setting offset: 30
    Polling.start 5 do
      puts "exec sleep 2"
      sleep 2
    end

result

    #[debug]=> start: 2013-03-24 23:38:25 +0900                                 
    #[debug]=> sleep 4.086651802062988seconds (until 2013-03-24 23:38:30 +0900) 
    2013-03-24 23:38:30 +0900                                        
    exec sleep 2                                                     
    #[debug]=> sleep 2.9990789890289307seconds (until 2013-03-24 23:38:35 +0900)
    2013-03-24 23:38:35 +0900                                        
    exec sleep 2                                                     
    #[debug]=> sleep 2.9979379177093506seconds (until 2013-03-24 23:38:40 +0900)
    2013-03-24 23:38:40 +0900                                        
    exec sleep 2                                                     
    #[debug]=> sleep 2.9986801147460938seconds (until 2013-03-24 23:38:45 +0900)
    2013-03-24 23:38:45 +0900                                        
    exec sleep 2                                                     
    #[debug]=> sleep 2.998732089996338seconds (until 2013-03-24 23:38:50 +0900) 

Async run

    Polling.async_run 5 do
      puts "exec sleep 2" 
      sleep 2             
      puts Time.now       
    end                   

async run result
    
    #[debug]=> start: 2013-03-31 07:17:58 +0900                       
    exec sleep 2                                           
    2013-03-31 07:18:00 +0900                              
    #[debug]=> sleep 2.998924seconds (until 2013-03-31 07:18:03 +0900)
    exec sleep 2                                           
    2013-03-31 07:18:05 +0900                              
    #[debug]=> sleep 2.999263seconds (until 2013-03-31 07:18:08 +0900)
    exec sleep 2                                           
    2013-03-31 07:18:10 +0900                              
    #[debug]=> sleep 2.998978seconds (until 2013-03-31 07:18:13 +0900)

debug

    require 'polling'
    Polling.setting offset: 5, debug: true
    Polling.start 5 do
      puts "test"
      sleep 2
    end

or

    require 'polling'
    Polling.start 5,true do
      puts "test"
      sleep 2
    end

Time which can be set up 

- 1 or other integer
- "5s" or like string type [s|m|h|d]
- [0,10,20,30,40,50] array class

It starts at per minute 0 second. 

    time = [0,10,20,30,40,50]
    Polling::run time, debug=true do
      puts "test"
      sleep 2
    end

setting parameters

- offset: Integer
- debug: Boolean
- print_start_time: Boolean

## Copyright

Copyright (c) 2012, hiro-su All rights reserved.
