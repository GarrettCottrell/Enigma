require 'date'

class Enigma
  attr_reader :input, :shift
  def initialize
    @input = "garrett cottrell" #or it could be './lib/message.txt'
    @shift = {}
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

  # def convert_to_array(key)
  # string_integer = pad_with_zero
  # string_integer.split("").map {|chr| chr.to_i}
  # end
  #
  # def create_keys
  #   integer_array = convert_to_array
  #   letter_array = ["A", "B", "C", "D"]
  #   key_hash = {}
  #   key_hash["A"] = integer_array[0..1]
  #   key_hash["B"] = integer_array[1..2]
  #   key_hash["C"] = integer_array[2..3]
  #   key_hash["D"] = integer_array[3..4]
  #   key_hash
  # end

  ###### The above code created "The Keys" ######

  ###### The below code creates "The Offsets" ######

  def get_current_date
  Date.today.strftime("%m%d%y")
  end

  def create_offset_integer_array

    current_date_integer = get_current_date.to_i
    squared_date = (current_date_integer ** 2)
    squared_date_string = squared_date.to_s
    last_4_digits = squared_date_string[-4..-1]
    last_4_digits_integer = last_4_digits.split("").map {|number| number.to_i}
  end

  def create_offset
    offset_hash = {}
    values = create_offset_integer_array
    keys = ["A", "B", "C", "D"]
    offset_hash = Hash[keys.zip(values)]
    offset_hash
  end

  ###### The above code creates "The Offsets"

  ###### The below code creates "The Shift"

  ######This method creares a hash for the "Final Shift"######
  def create_shift
    shifted_hash = create_keys.merge!(create_offset) {|key, value1, value2|
    ((value1.join.to_i) + value2)}

    @shift = shifted_hash
  end

  ###### The above code creates "The Shift"######

  ###### This method creates an array out of the original input ######
  def input_as_array
  @input.split("")
  end

###### The following methods define the A/B/C/D shifts ######

  def a_shift
  alphabet_array = create_character_set
  shift_values = @shift["A"]
  a_shift_array =  alphabet_array.rotate(-shift_values)
  end

  def b_shift
  alphabet_array = create_character_set
  shift_values = @shift["B"]
  bz_shift_array = alphabet_array.rotate(-shift_values)
  end

  def c_shift
  alphabet_array = create_characer_set
  shift_values = @shift["C"]
  c_shift_array = alphabet_array.rotate(-shift_values)
  end

  def d_shift
  alphabet_array = create_characer_set
  shift_values = @shift["D"]
  d_shift_array = alphabet_array.rotate(-shift_values)
  end

###### This is an array of the index values for ######
###### each letter in my input of where they ######
###### are in the actaul alphatt array ######
  def input_character_array_original
    original_character_array = []
    input_as_array.each do |letter|
    create_character_set.each do |character|
      if letter == character
        original_character_array << create_character_set.index(character)
        end
      end
    end
    original_character_array
  end

######The following method encrypts the message######

  def encrypt(message, key = enigma.create_key, date = enigma.get_current_date)

  end
end
