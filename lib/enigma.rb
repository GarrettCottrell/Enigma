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

  ###### The below 4 methods create "The Keys" ######

  def create_key
    4.times.map{rand(4)}.join
  end

  def pad_with_zero
    string_integer = create_key
    string_integer.to_s.rjust(5, "0")
  end

  def convert_to_array
  string_integer = pad_with_zero
  string_integer.split("").map {|chr| chr.to_i}
  end

  def create_keys
    integer_array = convert_to_array
    letter_array = ["A", "B", "C", "D"]
    key_hash = {}
    key_hash["A"] = integer_array[0..1]
    key_hash["B"] = integer_array[1..2]
    key_hash["C"] = integer_array[2..3]
    key_hash["D"] = integer_array[3..4]
    key_hash
  end

  ###### The above code created "The Keys" ######

  ###### The below code creates "The Offsets" ######

  def get_current_date
  Date.today.strftime("%m%d%y")
  end

  y
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

######The following methods encrypt the code######

######This method applies the "A" shift to every 4th character######
######starting with 0 and results in an array of the encrypted letters######
  def a_shift_encrypt
  current_shift = @shift
  alphabet_array = create_character_set
  original_input_array = input_as_array
  original_array = input_character_array_original
  a_shifted_array = []
  a_shift_holder = a_shift
  original_array.each do |index_value|
    if original_array.index(index_value).between?(0, ((original_array.length) -1)) && (original_array.index(index_value)) == 0 || (original_array.index(index_value) % 4 == 0)
    a_shifted_array << alphabet_array[(a_shift_holder.index(alphabet_array[index_value]))]
      end
    end
    a_shifted_array
  end

  def b_shift_encrypt
    current_shift = @shift
    alphabet_array = create_character_set
    original_input_array = input_as_array
    original_array = input_character_array_original
    b_shifted_array = []
    b_shift_holder = a_shift
    b_shift_original_input_array = original_array[1..((original_array.length) - 1)]
    b_shift_original_input_array.each_with_index do |value, index_of_value|
       if ((b_shift_original_input_array.index(index_of_value)) % 4 == 0)
         b_shifted_array << alphabet_array[(b_shift_holder.index(alphabet_array[index_of_value]))]

       end
       require "pry";binding.pry
    end
    b_shifted_array
  end
end
