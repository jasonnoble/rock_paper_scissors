class Scissors
  def Scissors.beats?(other)
    return 1 if other == Paper
    return 0 if other == Scissors
    return -1 if other == Rock
    nil
  end
end

class Paper
  def Paper.beats?(other)
    return 1 if other == Rock
    return 0 if other == Paper
    return -1 if other == Scissors
    nil
  end
end

class Rock
  def Rock.beats?(other)
    return 1 if other == Scissors
    return 0 if other == Rock
    return -1 if other == Paper
    nil
  end
end