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

  ###### The above code created "The Key and key hash" ######

  ###### get_current_date created a current_date string ######

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

  ######create_shifts assigns the shifts to their respective letters######

  def create_shifts(key, date)
    alphabet_array = create_character_set

    shift_hash = create_key_hash(key).merge!(create_offset_hash(date)) {|key, value1, value2|
    ((value1.join.to_i) + value2)}

    a_shift = alphabet_array.rotate(-shift_hash["A"])
    b_shift = alphabet_array.rotate(-shift_hash["B"])
    c_shift = alphabet_array.rotate(-shift_hash["C"])
    d_shift = alphabet_array.rotate(-shift_hash["D"])
  end

  ###### message_as_array creates an array out of the messsage ######
  def message_as_array(message)
  message.split("")
  end

# ###### This is an array of the index values for ######
# ###### each letter in my input of where they ######
# ###### are in the actaul alphatt array ######
#   def input_character_array_original(message)
#     original_character_array = []
#     message_as_array(message).each do |letter|
#     create_character_set.each do |character|
#       if letter == character
#         original_character_array << create_character_set.index(character)
#         end
#       end
#     end
#     original_character_array
#   end

######The following method encrypts the message######

  def encrypt(message, key = enigma.create_key, date = get_current_date)

    
  end
end
