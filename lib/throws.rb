# I am a pair of Scissors.  I only win if I play against
# Paper.
class Scissors
  def Scissors.beats?(other)
    return 1 if other == Paper
    return 0 if other == Scissors
    return -1 if other == Rock
    nil
  end
end

# I am a piece of Paper.  I only win if I play against
# Rock.
class Paper
  def Paper.beats?(other)
    return 1 if other == Rock
    return 0 if other == Paper
    return -1 if other == Scissors
    nil
  end
end

# I am a Rock.  I only win if I play against
# Scissors.
class Rock
  def Rock.beats?(other)
    return 1 if other == Scissors
    return 0 if other == Rock
    return -1 if other == Paper
    nil
  end
end