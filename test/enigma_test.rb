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
    assert_equal 5, enigma.create_key.length
  end

  def test_create_key_hash
    enigma = Enigma.new
    expected = {"A"=>[0, 4], "B"=>[4, 8], "C"=>[8, 5], "D"=>[5, 3]}

    assert_equal expected, enigma.create_key_hash("04853")
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
    expected = {"A"=>4, "B"=>52, "C"=>85, "D"=>53}

    assert_equal expected, enigma.create_shift("04853")
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
end
