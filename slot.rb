$coin = 100
$point = 0
$slot = true
$select = [0,10,20,30,"やめとく"]

def game_start
  puts "----------"
  puts "残りのコイン数：#{$coin}"
  puts "ポイント：　#{$point}"
  puts "何コイン入れますか？"
  puts "1(10コイン) 2(20コイン) 3(30コイン) 4(やめとく)"
  puts "----------"
  
  $putin = gets.chomp.to_i
  
end

def slot_game
  puts "エンターを3回押しましょう！"
  gets
  puts "----------"
  puts "|#{$num1}| | |"
  puts "|#{$num2}| | |"
  puts "|#{$num3}| | |"
  gets
  puts "|#{$num1}|#{$num4}| |"
  puts "|#{$num2}|#{$num5}| |"
  puts "|#{$num3}|#{$num6}| |"
  gets
  puts "|#{$num1}|#{$num4}|#{$num7}|"
  puts "|#{$num2}|#{$num5}|#{$num8}|"
  puts "|#{$num3}|#{$num6}|#{$num9}|"
end
  

def slot_result
  if $num2 == 7 && $num5 == 7 && $num8 == 7
    puts "----------"
    puts "おめでとう！真ん中に7がそろいました！"
    get_point = "#{100 * $putin}".to_i
    $point = $point + get_point
    puts "#{get_point}ポイント獲得！"
    get_coin = "#{100 * $putin}".to_i 
    puts "#{get_coin}コイン獲得！"
    $coin = $coin + get_coin - $select[$putin]
    puts "----------"
    
  elsif ($num1 == $num4 && $num4 == $num7) ||
        ($num2 == $num5 && $num5 == $num8) ||
        ($num3 == $num6 && $num6 == $num9)
    puts "----------"
    puts "おめでとう！横一列の数字がそろいました！"
    get_point = "#{50 * $putin}".to_i
    $point = $point + get_point
    puts "#{get_point}ポイント獲得！"
    get_coin = "#{50 * $putin}".to_i 
    puts "#{get_coin}コイン獲得！"
    $coin = $coin + get_coin - $select[$putin]
    puts "----------"
    
  elsif ($num1 == $num2 && $num2 == $num3) ||
        ($num4 == $num5 && $num5 == $num6) ||
        ($num7 == $num8 && $num8 == $num9)
    puts "----------"
    puts "おめでとう！縦一列の数字がそろいました！"
    get_point = "#{50 * $putin}".to_i
    $point = $point + get_point
    puts "#{get_point}ポイント獲得！"
    get_coin = "#{50 * $putin}".to_i 
    puts "#{get_coin}コイン獲得！"
    $coin = $coin + get_coin - $select[$putin]
    puts "----------"
    
  else
    puts "----------"
    puts "残念！もう一回挑戦してね！"
    $coin = $coin - $select[$putin]
    puts "残りのコイン数:#{$coin}"
    puts "ポイント：　#{$point}"
    puts "----------"
  end
end
  

  
def slot_loop
  puts "0（まだ続ける）1（終わりにする）"
  loop = gets.chomp.to_i
  
  if loop == 0
    $slot = true
    puts "Next Game!!"
  elsif loop == 1
    $slot = false
    puts "また遊ぼうねー！"
  else
    puts "初めからやり直してください！"
    $slot = false
  end
end

while $slot  do
  $num1 = rand(1..9)
  $num2 = rand(1..9)
  $num3 = rand(1..9)
  $num4 = rand(1..9)
  $num5 = rand(1..9)
  $num6 = rand(1..9)
  $num7 = rand(1..9)
  $num8 = rand(1..9)
  $num9 = rand(1..9)
  
  game_start
  
  if $coin < $select[$putin].to_i
    puts "コインが足りません！"
    puts "また挑戦してね！"
    return
  elsif $putin == 4
    puts "また挑戦してね！"
    return
  elsif $putin >= 5 || $putin ==0
    puts "初めからやり直してください"
    return
  end
  
  slot_game
 
  slot_result

  slot_loop
end