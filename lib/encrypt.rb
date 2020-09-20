require "./lib/enigma"
require "date"

enigma = Enigma.new

handle = File.open(ARGV[0], "r")

incoming_text = handle.read

new_text = enigma.encrypt(incoming_text.chomp)

handle.close

#downcased_text = incoming_text.downcase

writer = File.open(ARGV[1], "w")

writer.write(new_text.join)

writer.close
