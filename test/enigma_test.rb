require "./test/test_helper"
require "./lib/enigma"

class EnigmaTest <Minitest::Test
  def test_it_exists
    enigma = Enigma.new

    assert_instance_of Enigma, enigma
    assert_equal "garrett cottrell", enigma.input
  end

  def test_create_character_set
    enigma = Enigma.new
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal expected, enigma.create_character_set
  end

  def test_create_key
    enigma = Enigma.new
    assert_equal 4, enigma.create_key.length
  end

  def test_convert_to_array
    enigma = Enigma.new

    assert_equal 5, enigma.convert_to_array.length
    assert_equal 0, enigma.convert_to_array[0]
  end

  def test_pad_with_zero
    enigma = Enigma.new

    assert_equal "0", enigma.pad_with_zero[0]
  end

  def test_assign_characters_to_array_values
    enigma = Enigma.new

    assert_equal 4, enigma.create_keys.length
  end

  def test_get_current_date
    enigma = Enigma.new

    assert_equal "092020", enigma.get_current_date
  end

  def test_create_offset_integer_arrray
    enigma = Enigma.new

    assert_equal [0,4,0,0], enigma.create_offset_integer_array
  end

  def test_create_offset
    enigma = Enigma.new

    assert_equal ({"A"=>0, "B"=>4, "C"=>0, "D"=>0}), enigma.create_offset
  end

  def test_create_shift
    enigma = Enigma.new

    assert_equal 4, enigma.create_shift.length
  end

  def test_input_character_array_original

    enigma = Enigma.new

    assert_equal [], enigma.input_character_array_original
  end

  def test_input_as_array
    enigma = Enigma.new

    assert_equal ["g", "a", "r", "r", "e", "t", "t", " ", "c", "o", "t", "t", "r", "e", "l", "l"], enigma.input_as_array
  end

  def test_a_shift
    skip
    enigma = Enigma.new
    enigma.create_shift

    assert_equal [], enigma.a_shift
  end

  def test_input_character_array_original
    enigma = Enigma.new

    assert_equal [6, 0, 17, 17, 4, 19, 19, 26, 2, 14, 19, 19, 17, 4, 11, 11], enigma.input_character_array_original

  end

  def test_shift_encrypts
    enigma = Enigma.new
    enigma.create_shift

    assert_equal 4, enigma.a_shift_encrypt.length
    assert_equal [], enigma.b_shift_encrypt
  end
end
