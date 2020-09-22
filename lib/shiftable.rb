module Shiftable

  def create_character_set
    ("a".."z").to_a << " "
  end

  def create_key
  string_integer = (4.times.map{rand(10)}.join)
  string_integer.to_s.rjust(5, "0")
  end

  def create_key_hash(key)
  split_key = key.split("").map {|chr| chr.to_i}
  key_hash = {}
  key_hash["A"] = split_key[0..1]
  key_hash["B"] = split_key[1..2]
  key_hash["C"] = split_key[2..3]
  key_hash["D"] = split_key[3..4]
  key_hash
  end

  def get_current_date
  Date.today.strftime("%m%d%y")
  end

  def create_offset_hash(date)
  offset_number = ((date.to_i ** 2).to_s[-4..-1]).split("").map {|number| number.to_i}
  keys = ["A", "B", "C", "D"]
  offset_hash = Hash[keys.zip(offset_number)]
  offset_hash
  end

  def a_shift(key_value, date)
    shift_hash = create_key_hash(key_value).merge!(create_offset_hash(date)) {|key, value1, value2|
    ((value1.join.to_i) + value2)}
    shift_hash["A"]
  end

  def b_shift(key_value, date)
    shift_hash = create_key_hash(key_value).merge!(create_offset_hash(date)) {|key, value1, value2|
    ((value1.join.to_i) + value2)}
    shift_hash["B"]
  end

  def c_shift(key_value, date)
    shift_hash = create_key_hash(key_value).merge!(create_offset_hash(date)) {|key, value1, value2|
    ((value1.join.to_i) + value2)}
    shift_hash["C"]
  end

  def d_shift(key_value, date)
    shift_hash = create_key_hash(key_value).merge!(create_offset_hash(date)) {|key, value1, value2|
    ((value1.join.to_i) + value2)}
    shift_hash["D"]
  end
end
