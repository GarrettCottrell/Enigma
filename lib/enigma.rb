require 'date'

class Enigma
  attr_reader :input
  def initialize
    @input = "garrett cottrell"
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
  string_integer.split(//).map {|chr| chr.to_i}
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

  def create_offset_integer_array
    current_date_integer = get_current_date.to_i
    squared_date = (current_date_integer ** 2)
    squared_date_string = squared_date.to_s
    last_4_digits = squared_date_string[-4..-1]
    last_4_digits_integer = last_4_digits.split(//).map {|number| number.to_i}
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

  def create_shift
    shift = create_keys.merge!(create_offset) {|key, value1, value2|
    ((value1.join.to_i) + value2)}
  end

  ###### The above code creates "The Shift"######

  def input_array
  @input.split("")

  def rotate
    new_array = [["A"], ["B"], ["C"], ["D"]]
    input_array
  end
end
