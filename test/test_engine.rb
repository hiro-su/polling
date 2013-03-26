require File.expand_path(File.dirname(__FILE__)) + "/helper.rb"

class Polling::Engine::Test < Test::Unit::TestCase
  def setup
    @e = Polling::Engine.new
  end

  def test_engine_initialize
    assert_equal 0, @e.offset
    assert_equal 5, @e.target = 5
  end

  def test_increment!
    @e.target = 0
    assert_equal 10, @e.increment!(10)
    @e.target = 60
    assert_equal 130, @e.increment!(70)
  end

  def test_substitution!
    @e.target = 0
    assert_equal 10, @e.substitution!(10)
    @e.target = 60
    assert_equal 70, @e.substitution!(70)
  end

  def test_stime
    Time.stubs(:now).returns(Time.parse "2012/01/01 00:00:00")
    assert_equal 60, @e.stime(target: 0)

    arr = [1,5,10,20,30,40,50,58]
    arr.each do |time|
      assert_equal time, @e.stime(target: time)
    end

    assert_equal 10, @e.stime(target: @e.substitution!(10))
    assert_equal 20, @e.stime(target: @e.substitution!(20))
    assert_equal 30, @e.stime(target: @e.substitution!(30))

    @e.target = 10
    assert_equal 20, @e.stime(target: @e.increment!(10))
    assert_equal 40, @e.stime(target: @e.increment!(20))
    assert_equal 70, @e.stime(target: @e.increment!(30))

    Time.stubs(:now).returns(Time.parse "2012/12/31 23:50:20")
    arr = [30,40,50,60,70,80,90]
    arr.each do |time|
      assert_equal time - 20, @e.stime(target: time)
    end

    Time.stubs(:now).returns(Time.parse "2012/12/31 23:59:50")
    assert_equal 10, @e.stime(target: 0)
    assert_equal 60, @e.stime(target: @e.increment!(60))
    assert_equal 120, @e.stime(target: @e.increment!(120))
    assert_equal 300, @e.stime(target: @e.increment!(300))
  end

  def test_target
    assert_equal 0, @e.__send__(:target, 0, 0)
    assert_equal 10, @e.__send__(:target, 10, 0)
    assert_equal 5, @e.__send__(:target, 0, 5)
    assert_equal 15, @e.__send__(:target, 10, 5)
  end

  def test_now_sec_to_f
    Time.stubs(:now).returns(Time.parse "2012/01/01 00:00:00")
    assert_equal 0, @e.__send__(:now_sec_to_f, 60)
    Time.stubs(:now).returns(Time.parse "2012/01/01 00:00:30")
    assert_equal 30, @e.__send__(:now_sec_to_f, 60)
    Time.stubs(:now).returns(Time.parse "2012/01/01 00:00:33")
    assert_equal 33, @e.__send__(:now_sec_to_f, 60)
    Time.stubs(:now).returns(Time.parse "2012/01/01 00:00:30")
    assert_equal 30, @e.__send__(:now_sec_to_f, 120)
  end

  def test_make_sleep
    Time.stubs(:now).returns(Time.parse "2012/01/01 00:00:30")
    assert_equal -20, @e.__send__(:make_sleep, 10, @e.__send__(:now_sec_to_f,60))
    assert_equal -10, @e.__send__(:make_sleep, 20, @e.__send__(:now_sec_to_f,60))
    assert_equal 0, @e.__send__(:make_sleep, 30, @e.__send__(:now_sec_to_f,60))
    assert_equal 10, @e.__send__(:make_sleep, 40, @e.__send__(:now_sec_to_f,60))
    assert_equal 90, @e.__send__(:make_sleep, 120, @e.__send__(:now_sec_to_f,60))
  end

  def test_decrement!
    @e.target = 70
    assert_equal 10, @e.__send__(:decrement!, 60)
    assert_equal -110, @e.__send__(:decrement!, 120)
  end

  def test_debug
    Time.stubs(:now).returns(Time.parse "2012/01/01 00:00:30")
    opts = {
      debug: true,
      stime: 40
    }
    assert_nil @e.__send__(:debug, opts)
  end
end
