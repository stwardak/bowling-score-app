# decomp: write code to take in user input for name and pins/rolls
puts "Please enter name for Player 1:"
name = gets.chomp
player1 = {name: name, score: 0}

puts "Player: #{player1[:name]}
Score: #{player1[:score]}"


# decomp: write code to take in user input for rolls/pins for a single frame (1st frame)

game = [] 
frame = []
frame_index = 0

puts "Frame #{frame_index + 1}, Roll 1:"
roll1 = gets.to_i
frame[0] = roll1

puts "Frame #{frame_index + 1}, Roll 2:"
roll2 = gets.to_i
frame[1] = roll2

game[frame_index] = frame

puts "Frame #{frame_index + 1}: #{frame.inspect}"
puts "Current Game State: #{game.inspect}"

# decomp: hardcode scoring rules for a single frame (no strikes/spares)

puts "Frame #{frame_index + 1} total: #{game[frame_index][0]+game[frame_index][1]}"

# decomp: put the above code in a loop where there are 3 frames

game = []
score = 0
frame_index = 0

while frame_index < 3
  frame = []
  framenum = frame_index + 1

  puts "Frame #{frame_index + 1}, Roll 1:"
  roll1 = gets.to_i
  frame[0] = roll1

  puts "Frame #{frame_index + 1}, Roll 2:"
  roll2 = gets.to_i
  frame[1] = roll2

  game[frame_index] = frame

  score += game[frame_index][0] + game[frame_index][1]
  puts "Running Score: #{score}" 

  frame_index += 1

end

puts "Current Game State: #{game.inspect}"
puts "Current Score: #{score.inspect}"


# Rewrite all that as a .times loop

game = []
score = 0

3.times do |frame_index|
  
  frame = []
  
  puts "Frame #{frame_index + 1}, Roll 1:"
  roll1 = gets.to_i
  frame[0] = roll1

  puts "Frame #{frame_index + 1}, Roll 2:"
  roll2 = gets.to_i
  frame[1] = roll2

  game[frame_index] = frame
  
  score += game[frame_index][0] + game[frame_index][1]
  puts "Running Score: #{score}" 

  frame_index += 1

end

    
puts "Current Game State: #{game.inspect}"
puts "Current Score: #{score.inspect}"



# decomp: do it again as a .each loop




# include strikes and spares logic


# if roll1 == 10
#   strike = true
#   # roll2 is nil or 0, indicated as "X" in array?
#   frame[1] = 0
#   roll2 = 0
# else
#   puts "Frame #{framenum}, Roll 2:"
#   roll2 = gets.to_i
#   frame[1] = roll2

#   # score equals current score plus 10 plus next frame roll 1 and 2 ->  
#   # score += game[frame_index][0] + game[frame_index][1] + game[frame_index + 1][0] + game game[frame_index + 1][0]
#   if roll1 + roll2 == 10
#     spare = true
#       # spare
#       # roll2 is 10 - roll1, indicated as "/" in array?
#       # score equals current score plus 10 plus next frame roll 1 ->  
#       # score += game[frame_index][0] + game[frame_index][1] + game[frame_index + 1][0]
#   end
#     # score += game[frame_index][0] + game[frame_index][1]
# end

# game[frame_index] = frame

# if !strike && !spare
# score += game[frame_index][0] + game[frame_index][1]
# puts "Running Score: #{score}" 
# end

# if strike
#   score += game[frame_index][0] + game[frame_index][1] + game[frame_index + 1][0] + game game[frame_index + 1][0]
# elsif spare
#   score += game[frame_index][0] + game[frame_index][1] + game[frame_index + 1][0]
# else
#   score += game[frame_index][0] + game[frame_index][1]
#   puts "Running Score: #{score}" 
# end

# puts "Frame #{framenum}: #{frame.inspect}"
# puts "Current Game State: #{game.inspect}"



# decomp: write code for basic game structure (10 frames, 2 rolls per frame)

# hardcode 10th frame

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

game[frame_index] = frame_10

score += frame10.sum