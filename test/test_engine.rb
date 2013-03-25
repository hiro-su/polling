require File.expand_path(File.dirname(__FILE__)) + "/helper.rb"

class Polling::Engine::Test < Test::Unit::TestCase
  def test_engine_initialize
    e = Polling::Engine.new
    assert_equal 0, e.offset
    assert_equal 5, e.target = 5
  end

  def test_increment!
    e = Polling::Engine.new
    e.target = 0
    assert_equal 10, e.increment!(10)
    e.target = 60
    assert_equal 130, e.increment!(70)
  end

  def test_array!
    e = Polling::Engine.new
    e.target = 0
    assert_equal 10, e.array!(10)
    e.target = 60
    assert_equal 70, e.array!(70)
  end

   def test_stime
   end

   def test_target
   end

   def test_now_sec_to_f
   end

   def test_make_sleep
   end

   def test_decrement!
   end
end
