require 'date'
require './lib/shiftable'

class Cipher
  include Shiftable
  attr_reader :encrypted_text
  def initialize
  @alphabet_array = create_character_set
  @encrypted_text = []
  @counter = 1
  end

  def code_message(message, key, date)
    message.each_char do |letter|
      if @counter == 1 && @alphabet_array.include?(letter)
        counter_1_shift(letter, key, date)
      elsif @counter == 2 && @alphabet_array.include?(letter)
        counter_2_shift(letter, key, date)
      elsif @counter == 3 && @alphabet_array.include?(letter)
        counter_3_shift(letter, key, date)
      elsif @counter == 4 && @alphabet_array.include?(letter)
        counter_4_shift(letter, key, date)
      else
        @encrypted_text << letter
      end
    end
    @encrypted_text
  end

  def counter_1_shift(letter, key, date)
    old_index = @alphabet_array.find_index(letter)
    new_index = ((old_index) + (a_shift(key, date))) % (@alphabet_array.count)
    @encrypted_text << @alphabet_array[new_index]
    @counter += 1
  end

  def counter_2_shift(letter, key, date)
    old_index = @alphabet_array.find_index(letter)
    new_index = ((old_index) + (b_shift(key, date))) % (@alphabet_array.count)
    @encrypted_text << @alphabet_array[new_index]
    @counter += 1
  end

  def counter_3_shift(letter, key, date)
    old_index = @alphabet_array.find_index(letter)
    new_index = ((old_index) + (c_shift(key, date))) % (@alphabet_array.count)
    @encrypted_text << @alphabet_array[new_index]
    @counter += 1
  end

  def counter_4_shift(letter, key, date)
    old_index = @alphabet_array.find_index(letter)
    new_index = ((old_index) + (d_shift(key, date))) % (@alphabet_array.count)
    @encrypted_text << @alphabet_array[new_index]
    @counter = 1
  end
end
