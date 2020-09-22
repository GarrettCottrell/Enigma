require 'date'
require './lib/shiftable'

class Decipher
  include Shiftable
  attr_reader :decrypted_text
  def initialize
  @decrypted_text = []
  @counter = 1
  @alphabet_array = create_character_set
  end

  def decode_message(message, key, date)
    message.each_char do |letter|
      if @counter == 1 && @alphabet_array.include?(letter)
        counter_1_decode_shift(letter, key, date)
      elsif @counter == 2 && @alphabet_array.include?(letter)
        counter_2_decode_shift(letter, key, date)
      elsif @counter == 3 && @alphabet_array.include?(letter)
        counter_3_decode_shift(letter, key, date)
      elsif @counter == 4 && @alphabet_array.include?(letter)
        counter_4_decode_shift(letter, key, date)
      else @decrypted_text << letter
      end
    end
    @decrypted_text
  end

  def counter_1_decode_shift(letter, key, date)
     old_index = @alphabet_array.find_index(letter)
     decrypted_shift = (@alphabet_array.count) - (a_shift(key, date))
     decrypted_index = (old_index + decrypted_shift) % (@alphabet_array.count)
     @decrypted_text << @alphabet_array[decrypted_index]
     @counter += 1
  end

  def counter_2_decode_shift(letter, key, date)
    old_index = @alphabet_array.find_index(letter)
    decrypted_shift = (@alphabet_array.count) - (b_shift(key, date))
    decrypted_index = (old_index + decrypted_shift) % (@alphabet_array.count)
    @decrypted_text << @alphabet_array[decrypted_index]
    @counter += 1
  end

  def counter_3_decode_shift(letter, key, date)
    old_index = @alphabet_array.find_index(letter)
    decrypted_shift = (@alphabet_array.count) - (c_shift(key, date))
    decrypted_index = (old_index + decrypted_shift) % (@alphabet_array.count)
    @decrypted_text << @alphabet_array[decrypted_index]
    @counter += 1
  end

  def counter_4_decode_shift(letter, key, date)
    old_index = @alphabet_array.find_index(letter)
    decrypted_shift = (@alphabet_array.count) - (d_shift(key, date))
    decrypted_index = (old_index + decrypted_shift) % (@alphabet_array.count)
    @decrypted_text << @alphabet_array[decrypted_index]
    @counter = 1
  end
end
