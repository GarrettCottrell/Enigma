require "./lib/enigma"
require "./lib/decipher"
require "date"
enigma = Enigma.new
decipher = Decipher.new

handle = File.open(ARGV[0], "r")

message = handle.read
decrypt_hash = eval(message)


decrypted_message = decipher.decode_message(decrypt_hash[:encryption], decrypt_hash[:key], decrypt_hash[:date])

handle.close

writer = File.open(ARGV[1], "w")

writer.write(decrypted_message)

writer.close

puts "Created 'decrypted.txt' with the key #{decrypted_message[:key]} and date #{decrypted_message[:date]}"
