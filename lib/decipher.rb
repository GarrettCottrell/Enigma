require 'date'
require './lib/shiftable'

class Decipher
  include Shiftable
  def initialize
  end

  def decode_message(message, key, date)
  decrypted_text = []
  counter = 1
  alphabet_array = create_character_set
    message.each_char do |letter|
      if counter == 1 && alphabet_array.include?(letter)
        old_index = alphabet_array.find_index(letter)
        decrypted_shift = (alphabet_array.count) - (a_shift(key, date))
        decrypted_index = (old_index + decrypted_shift) % (alphabet_array.count)
        decrypted_text << alphabet_array[decrypted_index]
        counter += 1
      elsif counter == 2 && alphabet_array.include?(letter)
        old_index = alphabet_array.find_index(letter)
        decrypted_shift = (alphabet_array.count) - (b_shift(key, date))
        decrypted_index = (old_index + decrypted_shift) % (alphabet_array.count)
        decrypted_text << alphabet_array[decrypted_index]
        counter += 1
      elsif counter == 3 && alphabet_array.include?(letter)
        old_index = alphabet_array.find_index(letter)
        decrypted_shift = (alphabet_array.count) - (c_shift(key, date))
        decrypted_index = (old_index + decrypted_shift) % (alphabet_array.count)
        decrypted_text << alphabet_array[decrypted_index]
        counter += 1
      elsif counter == 4 && alphabet_array.include?(letter)
        old_index = alphabet_array.find_index(letter)
        decrypted_shift = (alphabet_array.count) - (d_shift(key, date))
        decrypted_index = (old_index + decrypted_shift) % (alphabet_array.count)
        decrypted_text << alphabet_array[decrypted_index]
        counter = 1
      else decrypted_text << letter
      end
    end
    decrypted_text
  end
end
