require "./test/test_helper"
require "./lib/enigma"

class EnigmaTest <Minitest::Test
  def test_it_exists
    enigma = Enigma.new

    assert_instance_of Enigma, enigma
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

  def test_create_offset_hash
    enigma = Enigma.new
    expected = {"A"=>0, "B"=>4, "C"=>0, "D"=>0}

    assert_equal expected, enigma.create_offset_hash(enigma.get_current_date)
  end

  def test_create_shifts
    enigma = Enigma.new
    expected_d = ["b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " ", "a"]

    assert_equal expected_d, enigma.create_shifts("04853", enigma.get_current_date)
  end

  def test_message_as_array
    enigma = Enigma.new

    assert_equal ["g", "a", "r", "r", "e", "t", "t", " ", "c", "o", "t", "t", "r", "e", "l", "l"], enigma.message_as_array("garrett cottrell")
  end

  def test_input_character_array_original
    skip
    enigma = Enigma.new

    assert_equal [6, 0, 17, 17, 4, 19, 19, 26, 2, 14, 19, 19, 17, 4, 11, 11], enigma.input_character_array_original("garrett cottrell")

  end

  def test_encrypt
    enigma = Enigma.new

    assert_equal [], enigma.encrypt("garrett cottrell", "04853")
  end
end
