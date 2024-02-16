# player class
class Player
  attr_accessor :name, :score

  def initialize(name)
    @name = name
    @score = 0
  end

end


# frame class
class Frame

  attr_accessor :rolls, :frame_score

  def initialize
    @rolls = []
    @frame_score = 0
  end

  def add_roll(pins)
    @rolls << pins
  end
  
  def calculate_frame
    @frame_score = @rolls.sum
  end

end

# game class
class Game
  attr_accessor :frames, :player

  def initialize(player_name) # single player for now
    @player = Player.new(player_name)
    @frames = Array.new(10){Frame.new}
  end

  def play
    9.times do |frame_index|
      frame = @frames[frame_index]
    
      puts "Frame #{frame_index + 1}, Roll 1:"
      roll1 = gets.to_i
      frame.add_roll(roll1)
    
      if roll1 == 10
        puts "Strike!"
        frame.add_roll(0)
      else
        puts "Frame #{frame_index + 1}, Roll 2:"
        roll2 = gets.to_i
        frame.add_roll(roll2)
        if roll1 + roll2 == 10
          puts "Spare!"
        end
      end

     

      def calculate_score() #pick up here
        if frame_index > 0

          if game[frame_index - 1][0] == 10 
            score += frame.sum
          elsif game[frame_index - 1].sum == 10
            score += frame[0] 
          end
        end
      
        if frame_index > 1 && game[frame_index - 2][0] == 10 && game[frame_index - 1][0] == 10
          score += roll1
        end
      
  
        if frame.sum < 10 
          puts "Running Score: #{score}"
          puts "Current Game State: #{game.inspect}"
        elsif frame[0] == 10
          puts "Current Score: #{score} plus your next two rolls"
          puts "Current Game State: #{game.inspect}"
        else
          puts "Current Score: #{score} plus your next roll"
          puts "Current Game State: #{game.inspect}"
        end
      end

      calculate_score(frame, frame_index)
      @player.score += frame.score
      puts "Score: #{@player.score}"
    end
  end




end

# series class
class Series
  attr_accessor :games
  def initialize 
    @games = []
  end


end

puts "Please enter name for Player 1:"
name = gets.chomp
game = Game.new(name)
game.play
# puts "Current Game State: #{game.inspect}"
# puts "Final Score: #{score}"