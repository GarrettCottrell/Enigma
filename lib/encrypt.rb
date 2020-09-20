file = File.open(ARGV[0], "r")
incoming_text = file.read
file.close
downcased_text = incoming_text.downcase
writer = File.open(ARGV[1], "w")
writer.write(downcased_text.encrypt)
writer.close
