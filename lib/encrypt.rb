require "./lib/enigma"
require "./lib/cipher"
require "date"
enigma = Enigma.new
cipher = Cipher.new

handle = File.open(ARGV[0], "r")

incoming_text = handle.read

new_text = cipher.code_message(incoming_text.downcase.chomp)

handle.close

writer = File.open(ARGV[1], "w")

writer.write(new_text)

writer.close

puts "Created 'encrypted.txt' with the key #{new_text[:key]} and date #{new_text[:date]}"
