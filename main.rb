puts "Please enter name for Player 1:"
name = gets.chomp
player1 = { name: name, score: 0 }

puts "Player: #{player1[:name]}"
puts "Score: #{player1[:score]}"

game = []
score = 0

9.times do |frame_index|
  frame = []

  puts "Frame #{frame_index + 1}, Roll 1:"
  roll1 = gets.to_i
  frame[0] = roll1

  if roll1 == 10
    frame[1] = 0
    puts "Strike!"
  else
    puts "Frame #{frame_index + 1}, Roll 2:"
    roll2 = gets.to_i
    frame[1] = roll2
    if roll1 + roll2 == 10
      puts "Spare!"
    end
  end

  game[frame_index] = frame


  score += frame.sum


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

  #pickup here
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

frame10 = []

puts "Frame 10, Roll 1:"
roll1 = gets.to_i
frame10[0] = roll1

if roll1 == 10
  puts "Strike!"
  puts "Frame 10, Roll 2:"
  roll2 = gets.to_i
  frame10[1] = roll2

  puts "Frame 10, Roll 3:"
  roll3 = gets.to_i
  frame10[2] = roll3

else
  puts "Frame 10, Roll 2:"
  roll2 = gets.to_i
  frame10[1] = roll2

  if roll1 + roll2 == 10
    puts "Spare!"
    puts "Frame 10, Roll 3:"
    roll3 = gets.to_i
    frame10[2] = roll3
  end

end

game[9] = frame10
score += frame10.sum

if game[8][0] == 10 
  score += frame10[0] + frame10[1]
elsif game[8].sum == 10
  score += frame10[0] 
end


puts "Current Game State: #{game.inspect}"
puts "Final Score: #{score}"
