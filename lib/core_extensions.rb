class << Math
  def log2(n); log(n) / log(2); end
end

class Array
  def half_size; size >> 1; end
  def top_half; self[0, half_size]; end
  def bottom_half; self[half_size, half_size]; end
end
