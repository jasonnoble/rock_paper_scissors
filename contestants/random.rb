class Random
  def result
    random = rand
    return :rock if random < 0.33
    return :paper if random >= 0.33 && random < 0.66
    return :scissors 
  end
end
