class Scissors
  def Scissors.beats?(other)
    return true if other == Paper
    false
  end
end

class Paper
  def Paper.beats?(other)
    return true if other == Rock
    false
  end
end

class Rock
  def Rock.beats?(other)
    return true if other == Scissors
    false
  end
end