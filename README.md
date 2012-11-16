# Polling

ruby polling library

## Installation

Add this line to your application's Gemfile:

    gem 'polling'

Or install it yourself as:

    $ gem install polling

## Usage

It starts at per minute 0 second. 

    time = [0,10,20,30,40,50]
    Polling::run(time,debug=true) do
      puts "test"
      sleep 2
    end

result

    start: 2012-11-16 19:47:36 +0900
    sleep 23.980872869491577seconds (until 2012-11-16 19:48:00 +0900)
    test
    sleep 7.999034881591797seconds (until 2012-11-16 19:48:10 +0900)
    test
    sleep 7.999000072479248seconds (until 2012-11-16 19:48:20 +0900)
    test
    sleep 7.998318195343018seconds (until 2012-11-16 19:48:30 +0900)
    test
    sleep 7.998938083648682seconds (until 2012-11-16 19:48:40 +0900)
    test
    sleep 7.999677896499634seconds (until 2012-11-16 19:48:50 +0900)
    test
    sleep 7.998055934906006seconds (until 2012-11-16 19:49:00 +0900)
    test
    sleep 7.998072147369385seconds (until 2012-11-16 19:49:10 +0900)
    
The multiple of 60 is set up. 

    time = [300]
    Polling::run(time) do
      puts "hoge"
      sleep 2
    end

Please set a vlue that is divisible by 60.

    time = ["5s"] #or 5. support string is s,m,h,d.
    Polling::run(time) do
      puts "test"
      sleep 2
    end

## Copyright

Copyright (c) 2012, hiro-su All rights reserved.
