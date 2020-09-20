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

  def test_a_shift
    enigma = Enigma.new

    assert_equal 4, enigma.a_shift("04853", enigma.get_current_date)
  end

  def test_b_shift
    enigma = Enigma.new

    assert_equal 52, enigma.b_shift("04853", enigma.get_current_date)
  end

  def test_c_shift
    enigma = Enigma.new

    assert_equal 85, enigma.c_shift("04853", enigma.get_current_date)
  end

  def test_d_shift
    enigma = Enigma.new

    assert_equal 53, enigma.d_shift("04853", enigma.get_current_date)
  end

  def test_message_as_array
    enigma = Enigma.new

    assert_equal ["g", "a", "r", "r", "e", "t", "t", " ", "c", "o", "t", "t", "r", "e", "l", "l"], enigma.message_as_array("garrett cottrell")
  end

  def test_shift
    enigma = Enigma.new

    assert_equal 53, enigma.shift("x", "04853", enigma.get_current_date)
  end

  def test_encrypt

    enigma = Enigma.new

    assert_equal "keppissdgssspikk", enigma.encrypt("garrett cottrell", "04853")
  end
end
