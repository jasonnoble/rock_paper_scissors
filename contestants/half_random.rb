class HalfRandom
  def result
    random = rand
    return :rock if random < 0.25
    return :scissors 
  end
end
