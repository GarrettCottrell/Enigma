require "./lib/enigma"
require "./lib/cipher"
require "date"
enigma = Enigma.new
cipher = Cipher.new

handle = File.open(ARGV[0], "r")

incoming_text = handle.read

if ARGV[2] == nil
  ARGV[2] = enigma.create_key
end

if ARGV[3] == nil
  ARGV[3] = enigma.get_current_date
end

new_text = enigma.encrypt(incoming_text.downcase.chomp, ARGV[2], ARGV[3])

handle.close

writer = File.open(ARGV[1], "w")

writer.write(new_text)

writer.close

puts "Created 'encrypted.txt' with the key #{new_text[:key]} and date #{new_text[:date]}"
