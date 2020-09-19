require 'date'

class Enigma
  attr_reader :input
  def initialize
    @input = "garrett cottrell"
  end

  def create_alphabet
    ("a".."z").to_a << " "
  end

  ######The following 4 methods all help to ultimately create "The Keys"######
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

  def assign_characters_to_array_values
    integer_array = convert_to_array
    letter_array = ["A", "B", "C", "D"]
    key_hash = {}
    key_hash["A"] = integer_array[0..1]
    key_hash["B"] = integer_array[1..2]
    key_hash["C"] = integer_array[2..3]
    key_hash["D"] = integer_array[3..4]
    key_hash
  end
  ######The above code created "The Keys"######

  def get_current_date
  Date.today.strftime("%m%d%y")
  end

  def create_offsets
    current_date_integer = get_current_date.to_i
    squared_date = (current_date_integer ** 2)
  end
end
