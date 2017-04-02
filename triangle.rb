direction = ""
# Write an action using puts
# To debug: STDERR.puts "Debug messages..."
light_x = 40
light_y = 18
initial_tx = 1
initial_ty = 18

if light_x != initial_tx || light_y != initial_ty
    sideB = [light_x, initial_tx].max - [light_x, initial_tx].min
    sideA = [light_y, initial_ty].max - [light_y, initial_ty].min
    tan = sideB/sideA
    angle = Math.atan(tan)
    puts angle * (180 / Math::PI)



end

if light_x == initial_tx
    if light_y > initial_ty
        direction = "S"
    else
        direction = "N"
    end
elsif light_y == initial_ty
   if light_x > initial_tx
       direction = "E"
   else
       directon = "W"
   end
end

# A single line providing the move to be made: N NE E SE S SW W or NW
puts direction
