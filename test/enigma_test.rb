require "./test/test_helper"
require "./lib/enigma"

class EnigmaTest <Minitest::Test
  def test_it_exists
    enigma = Enigma.new

    assert_instance_of Enigma, enigma
    assert_equal "garrett cottrell", enigma.input
  end

  def test_create_alphabet
    enigma = Enigma.new
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal expected, enigma.create_alphabet
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

    assert_equal "091820", enigma.get_current_date
  end

  def test_create_offset_integer_arrray
    enigma = Enigma.new

    assert_equal [2,4,0,0], enigma.create_offset_integer_array
  end

  def test_create_offset
    enigma = Enigma.new

    assert_equal ({"A"=>2, "B"=>4, "C"=>0, "D"=>0}), enigma.create_offset
  end

  def test_create_shift
    enigma = Enigma.new

    assert_equal ({"A"=>3, "B"=>27, "C"=>73, "D"=>20}), enigma.create_shift
  end
end
