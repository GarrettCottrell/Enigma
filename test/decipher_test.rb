require "./test/test_helper"
require "./lib/decipher"
require './lib/shiftable'
require './lib/cipher'

class DecipherTest <Minitest::Test
  def test_it_exists
    decipher = Decipher.new

    assert_instance_of Decipher, decipher
  end

  def test_create_key
    decipher = Decipher.new
    assert_equal 5, decipher.create_key.length
  end

  def test_get_current_date
    decipher = Decipher.new

    assert_equal "092220", decipher.get_current_date
  end

  def test_a_shift
    decipher = Decipher.new

    assert_equal 12, decipher.a_shift("04853", decipher.get_current_date)
  end

  def test_b_shift
    decipher = Decipher.new

    assert_equal 52, decipher.b_shift("04853", decipher.get_current_date)
  end

  def test_c_shift
    decipher = Decipher.new

    assert_equal 85, decipher.c_shift("04853", decipher.get_current_date)
  end

  def test_d_shift
    decipher = Decipher.new

    assert_equal 53, decipher.d_shift("04853", decipher.get_current_date)
  end

  def test_create_character_set
    decipher = Decipher.new
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal expected, decipher.create_character_set
  end

  def test_create_key_hash
    decipher = Decipher.new
    expected = {"A"=>[0, 4], "B"=>[4, 8], "C"=>[8, 5], "D"=>[5, 3]}

    assert_equal expected, decipher.create_key_hash("04853")
  end

  def test_create_offset_hash
    decipher = Decipher.new
    expected = {"A"=>8, "B"=>4, "C"=>0, "D"=>0}

    assert_equal expected, decipher.create_offset_hash(decipher.get_current_date)
  end

  def test_decode_message
    decipher = Decipher.new
    cipher = Cipher.new
    cipher.code_message("garrett cottrell!", "04853", "092120")
    expected = ["g", "a", "r", "r", "e", "t", "t", " ", "c", "o", "t", "t", "r", "e", "l", "l", "!"]

    assert_equal expected, decipher.decode_message("ozvqmrxzkmxszcpk!", "04853", "092120")
  end

  def test_counter_1_decode_shift
    decipher = Decipher.new
    cipher = Cipher.new
    cipher.code_message("g", "04853", "092120")
    decipher.counter_1_decode_shift("o", "04853", "092120")

    assert_equal ["g"], decipher.decrypted_text
  end

  def test_counter_2_decode_shift
    decipher = Decipher.new
    cipher = Cipher.new
    cipher.code_message("a", "04853", "092120")
    decipher.counter_2_decode_shift("z", "04853", "092120")

    assert_equal ["a"], decipher.decrypted_text
  end

  def test_counter_3_decode_shift
    decipher = Decipher.new
    cipher = Cipher.new
    cipher.code_message("r", "04853", "092120")
    decipher.counter_3_decode_shift("v", "04853", "092120")

    assert_equal ["r"], decipher.decrypted_text
  end

  def test_counter_4_decode_shift
    decipher = Decipher.new
    cipher = Cipher.new
    cipher.code_message("r", "04853", "092120")
    decipher.counter_4_decode_shift("q", "04853", "092120")

    assert_equal ["r"], decipher.decrypted_text
  end
end
