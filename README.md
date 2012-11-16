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
    Polling::run(time,debug=false) do
      puts "test"
      sleep 2
    end
    
The multiple of 60 is set up. 

    time = [300]
    Polling::run(time) do
      puts "hoge"
      sleep 2
    end

Please set a vlue that is divisible by 60.

    time = ["5s"]
    Polling::run(time) do
      puts "test"
      sleep 2
    end

## Copyright

Copyright (c) 2012, hiro-su All rights reserved.
