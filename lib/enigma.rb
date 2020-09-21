require 'date'
require './lib/shiftable'

class Enigma
  include Shiftable
  def initialize
  end

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


###### Encrypt takes the given message and returns the encrypted message ######

  def encrypt(message, key = create_key, date = get_current_date)
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
  encrypted_output = {}

  encrypted_output[:encryption] = encrypted_text.join
  encrypted_output[:key] = key
  encrypted_output[:date] = date

  encrypted_output
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
