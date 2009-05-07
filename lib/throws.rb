class Throw
  include Comparable
  
  def Throw.beats?(other)
    true
  end
end

class Scissors < Throw
  def Scissors.beats?(other)
    return true if other == Paper
    false
  end
end

class Paper < Throw
  def Paper.beats?(other)
    return true if other == Rock
    false
  end
end

class Rock < Throw
  def Rock.beats?(other)
    return true if other == Scissors
    false
  end
end