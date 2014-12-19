class Automaton
  def initialize
    @key = "00011110".reverse
  end

  def offspring(array)
    str = ""
    child = ""
    for i in 1..array.length-2
      child = @key[array[i-1..i+1].to_i(2)]
      str += child
    end
    return str
  end

  def convert(str)
    value = str.tr('0',' ')
    value = value.tr('1','X')
    return value
  end

  def evolve
    puts "Press Enter to begin. Press Enter again to stop the script."
    gets
    t = Thread.new do
      gen = "00100"
      puts convert(gen)
      while true
        sleep 1
        next_gen = '00' + offspring(gen) + '00'
        gen = next_gen
        puts convert(gen)
      end
    end
    gets
    t.kill
  end
end




play = Automaton.new
play.evolve
