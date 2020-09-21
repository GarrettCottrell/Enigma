require "./lib/enigma"
require "date"
enigma = Enigma.new

handle = File.open(ARGV[0], "r")

incoming_text = handle.read

new_text = enigma.encrypt(incoming_text.downcase.chomp)

handle.close

writer = File.open(ARGV[1], "w")

writer.write(new_text)

writer.close

puts "Created 'encrypted.txt' with the key #{new_text[:key]} and date #{new_text[:date]}"
