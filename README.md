# Polling

ruby polling library

## Installation

Add this line to your application's Gemfile:

    gem 'polling'

## Usage

It starts at per minute 0 second. 

    time = [0,10,20,30,40,50]
    Polling::run(time,debug=false) do
      puts "hoge"
    end
    

The multiple of 60 is set up. 

    time = [300]
    Polling::run(time) do
      puts "hoge"
    end

## Copyright

Copyright:: Copyright (c) 2012, hiro-su All rights reserved.
