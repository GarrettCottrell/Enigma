require 'date'

class Enigma
  attr_reader :input, :shift
  def initialize
  end

  def create_character_set
 ("a".."z").to_a << " "
  end

###### create_key generates a 0 padded 5 different random key string ######

  def create_key
  string_integer = (4.times.map{rand(4)}.join)
  string_integer.to_s.rjust(5, "0")
  end

###### create_key_hash is hard-coded, try to go back and refactor after ######

  def create_key_hash(key)
  split_key = key.split("").map {|chr| chr.to_i}
  letters = ["A", "B", "C", "D"]
  key_hash = {}
  key_hash["A"] = split_key[0..1]
  key_hash["B"] = split_key[1..2]
  key_hash["C"] = split_key[2..3]
  key_hash["D"] = split_key[3..4]
  key_hash
  end

  ###### get_current_date creates a current_date string ######

  def get_current_date
  Date.today.strftime("%m%d%y")
  end

  ###### create_offset_hash creates the ######
  ###### offset hash based off of current_date ######

  def create_offset_hash(date)
  offset_number = ((date.to_i ** 2).to_s[-4..-1]).split("").map {|number| number.to_i}
  keys = ["A", "B", "C", "D"]
  offset_hash = Hash[keys.zip(offset_number)]
  offset_hash
  end

  ###### These shifts define how much each shift ######
  ###### is moving the alphabet_array and return an integer ######

  def a_shift(key, date)
    alphabet_array = create_character_set
    shift_hash = create_key_hash(key).merge!(create_offset_hash(date)) {|key, value1, value2|
    ((value1.join.to_i) + value2)}
    a_shift = shift_hash["A"]
  end

  def b_shift(key, date)
    alphabet_array = create_character_set
    shift_hash = create_key_hash(key).merge!(create_offset_hash(date)) {|key, value1, value2|
    ((value1.join.to_i) + value2)}
    b_shift = shift_hash["B"]
  end

  def c_shift(key, date)
    alphabet_array = create_character_set
    shift_hash = create_key_hash(key).merge!(create_offset_hash(date)) {|key, value1, value2|
    ((value1.join.to_i) + value2)}
    c_shift = shift_hash["C"]
  end

  def d_shift(key, date)
    alphabet_array = create_character_set
    shift_hash = create_key_hash(key).merge!(create_offset_hash(date)) {|key, value1, value2|
    ((value1.join.to_i) + value2)}
    d_shift = shift_hash["D"]
  end

  ###### message_as_array creates an array out of the messsage ######

  def message_as_array(message)
  message.split("")
  end

###### shift defines which letters should be shifted by which shifts ######
###### this is hard-coded, need to go back and refactor ######

  def shift(letter, key, date)

    if ["a", "e", "i", "m", "q", "u", "y"].include?(letter)
      a_shift(key, date)
    elsif ["b", "f", "j", "n", "r", "v", "z"].include?(letter)
      b_shift(key, date)
    elsif ["c",  "g",  "k", "o", "s", "w", " "].include?(letter)
      c_shift(key, date)
    else
      d_shift(key, date)
    end
  end

###### Encrypt takes the given message and returns the encrypted message ######

  def encrypt(message, key = create_key, date = get_current_date)
    encrypted_text = []
    alphabet_array = create_character_set
      message.each_char do |letter|
        old_index = alphabet_array.find_index(letter)
        new_index = ((old_index) + (shift(letter, key, date))) % (alphabet_array.count)
        encrypted_text << alphabet_array[new_index]
    end
    encrypted_output = {}

    encrypted_output[:encryption] = encrypted_text.join
    encrypted_output[:key] = key
    encrypted_output[:date] = date

    encrypted_output
  end
end
