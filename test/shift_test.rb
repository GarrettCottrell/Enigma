require "./test/test_helper"
require "./lib/shift"
require "./lib/enigma"
require "date"

class ShiftTest <Minitest::Test
  def test_it_exists
    shift = Shift.new

    assert_instance_of Shift, shift
  end

  def test_create_character_set
    shift = Shift.new
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]

    assert_equal expected, shift.create_character_set
  end

  def test_create_key
    shift = Shift.new

    assert_equal 5, shift.create_key.length
  end
end
