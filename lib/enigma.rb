require 'date'
require './lib/shiftable'

class Enigma
  include Shiftable
  def initialize
  end
  
###### decrypt takes an encrypted message ######
###### and the key and returns the original message ######

  def decrypt(message, key, date = get_current_date)
  decrypted_text = []
  counter = 1
  alphabet_array = create_character_set
    message.each_char do |letter|
      if counter == 1
        old_index = alphabet_array.find_index(letter)
        decrypted_shift = (alphabet_array.count) - (a_shift(key, date))
        decrypted_index = (old_index + decrypted_shift) % (alphabet_array.count)
        decrypted_text << alphabet_array[decrypted_index]
        counter += 1
      elsif counter == 2
        old_index = alphabet_array.find_index(letter)
        decrypted_shift = (alphabet_array.count) - (b_shift(key, date))
        decrypted_index = (old_index + decrypted_shift) % (alphabet_array.count)
        decrypted_text << alphabet_array[decrypted_index]
        counter += 1
      elsif counter == 3
        old_index = alphabet_array.find_index(letter)
        decrypted_shift = (alphabet_array.count) - (c_shift(key, date))
        decrypted_index = (old_index + decrypted_shift) % (alphabet_array.count)
        decrypted_text << alphabet_array[decrypted_index]
        counter += 1
      elsif counter == 4
        old_index = alphabet_array.find_index(letter)
        decrypted_shift = (alphabet_array.count) - (d_shift(key, date))
        decrypted_index = (old_index + decrypted_shift) % (alphabet_array.count)
        decrypted_text << alphabet_array[decrypted_index]
        counter = 1
      end
    end
  decrypted_output = {}

  decrypted_output[:decryption] = decrypted_text.join
  decrypted_output[:key] = key
  decrypted_output[:date] = date

  decrypted_output
  end
end
