#encoding: UTF-8

# Returns a string of the form:
# 
#     "#{full_char}#{full_char}#{full_char}...#{empty_char}#{empty_char}..."
# 
# Ratio of +full_char+"s to +empty_char+"s in the string is +value+/+max_value+
# (rounded up).
# 
# +size+ is String#size() of the resultant string.
# 
# It raises Exception if +value+ > +max_value+.
# 
# Examples:
# 
#     progress_bar(2, 5, 10, "A", ".")  #=>  AAAA......
# 
#     progress_bar(3, 6, 5, "A", ".")  #=>  AAA..
# 
def progress_bar(value, max_value, size, full_char, empty_char)
  raise "Ты мне тут не хулигань!" if value < 0 or max_value < 0 or size < 0
  raise "Лопнет же, значение больше максимального"  if value > max_value
  amount = (size/(max_value/value.to_f)).ceil
  bar = full_char*amount
  bar << empty_char*(size-amount)
  return bar
end

def set_cursor_at(column, row)
  print "\e[#{row};#{column}H"
end
