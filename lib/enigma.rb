require 'date'
require './lib/shiftable'
require './lib/cipher'
require './lib/decipher'

class Enigma
  include Shiftable
  attr_reader :cipher
  def initialize
  end

  def encrypt(message, key = create_key, date = get_current_date)
    cipher = Cipher.new
    encrypted_output = {}
    encrypted_output[:encryption] = cipher.code_message(message, key, date).join
    encrypted_output[:key] = key
    encrypted_output[:date] = date
    encrypted_output
  end

  def decrypt(ciphertext, key, date = get_current_date)
    decipher = Decipher.new
    decrypted_output = {}
    decrypted_output[:decryption] = decipher.decode_message(ciphertext, key, date).join
    decrypted_output[:key] = key
    decrypted_output[:date] = date

    decrypted_output
  end
end
