require 'date'
require './lib/shiftable'

class Cipher
  include Shiftable
  def initialize
  end

  def code_message(message, key, date)
  encrypted_text = []
  counter = 1
  alphabet_array = create_character_set
    message.each_char do |letter|
      if counter == 1
        old_index = alphabet_array.find_index(letter)
        new_index = ((old_index) + (a_shift(key, date))) % (alphabet_array.count)
        encrypted_text << alphabet_array[new_index]
        counter += 1
      elsif counter == 2
        old_index = alphabet_array.find_index(letter)
        new_index = ((old_index) + (b_shift(key, date))) % (alphabet_array.count)
        encrypted_text << alphabet_array[new_index]
        counter += 1
      elsif counter == 3
        old_index = alphabet_array.find_index(letter)
        new_index = ((old_index) + (c_shift(key, date))) % (alphabet_array.count)
        encrypted_text << alphabet_array[new_index]
        counter += 1
      elsif counter == 4
        old_index = alphabet_array.find_index(letter)
        new_index = ((old_index) + (d_shift(key, date))) % (alphabet_array.count)
        encrypted_text << alphabet_array[new_index]
        counter = 1
      end
    end
    encrypted_text
  end
end
