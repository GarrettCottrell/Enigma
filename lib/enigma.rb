class Enigma
  attr_reader :input
  def initialize
    @input = "garrett cottrell"
  end

  def create_alphabet
    ("a".."z").to_a << " "
  end
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
end
