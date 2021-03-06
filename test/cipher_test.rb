require "./test/test_helper"
require './lib/shiftable'
require './lib/cipher'

class CipherTest <Minitest::Test
  def test_it_exists
    cipher = Cipher.new

    assert_instance_of Cipher, cipher
  end

  def test_code_message
    cipher = Cipher.new

    expected = ["o", "z", "v", "q", "m", "r", "x", "z", "k", "m", "x", "s", "z", "c", "p", "k", "!"]

    assert_equal expected, cipher.code_message("garrett cottrell!", "04853", "092120")
  end

  def test_create_key
    cipher = Cipher.new
    assert_equal 5, cipher.create_key.length
  end

  def test_get_current_date
    cipher = Cipher.new

    assert_equal "092220", cipher.get_current_date
  end

  def test_a_shift
    cipher = Cipher.new

    assert_equal 12, cipher.a_shift("04853", cipher.get_current_date)
  end

  def test_b_shift
    cipher = Cipher.new

    assert_equal 52, cipher.b_shift("04853", cipher.get_current_date)
  end

  def test_c_shift
    cipher = Cipher.new

    assert_equal 85, cipher.c_shift("04853", cipher.get_current_date)
  end

  def test_d_shift
    cipher = Cipher.new

    assert_equal 53, cipher.d_shift("04853", cipher.get_current_date)
  end

  def test_create_character_set
    cipher = Cipher.new
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal expected, cipher.create_character_set
  end

  def test_create_key_hash
    cipher = Cipher.new
    expected = {"A"=>[0, 4], "B"=>[4, 8], "C"=>[8, 5], "D"=>[5, 3]}

    assert_equal expected, cipher.create_key_hash("04853")
  end

  def test_create_offset_hash
    cipher = Cipher.new
    expected = {"A"=>8, "B"=>4, "C"=>0, "D"=>0}

    assert_equal expected, cipher.create_offset_hash(cipher.get_current_date)
  end

  def test_counter_1_shift
    cipher = Cipher.new
    cipher.counter_1_shift("g", "04853", "092120")

    assert_equal ["o"], cipher.encrypted_text
  end

  def test_counter_2_shift
    cipher = Cipher.new
    cipher.counter_2_shift("a", "04853", "092120")

    assert_equal ["z"], cipher.encrypted_text
  end

  def test_counter_3_shift
    cipher = Cipher.new
    cipher.counter_3_shift("r", "04853", "092120")

    assert_equal ["v"], cipher.encrypted_text
  end

  def test_counter_4_shift
    cipher = Cipher.new
    cipher.counter_4_shift("r", "04853", "092120")

    assert_equal ["q"], cipher.encrypted_text
  end
end
