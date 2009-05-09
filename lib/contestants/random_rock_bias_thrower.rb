class RandomRockBiasThrower
  def initialize
  end

  def play
    random = Kernel.rand
    return Rock if random < 0.50
    return Paper if random >= 0.50 && random < 0.75
    return Scissors 
  end
end
