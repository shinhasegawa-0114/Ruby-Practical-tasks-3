

def roulette(coin, point)
  
  coin_sheet = gets.chomp.to_i
  
    if coin_sheet >= 4
      puts "-------------------------------------------"
      puts "合計 #{point} ポイントでした"
      puts "お疲れ様でした"
      puts "-------------------------------------------"
      coin = 0
      point = 0
      return coin, point, false
    elsif coin_sheet * 10 > coin
      puts "-----------------------"
      puts "コインの枚数が足りません"
      puts "枚数を選び直して下さい"
      coin = 0
      point = 0
      return coin, point, true
   else
      puts "Let's Go!!"
   end
  
  a = []
  b = []
  c = []

  puts "Enterを3回押しましょう"
  
  gets.chomp
  puts "-----------------------"
  3.times do 
    number1 = rand(5)
    puts "|#{number1}| | |"
    a.push(number1)
  end
  
  gets.chomp
  puts "-----------------------"
  index = 0
  3.times do 
    number2 = rand(5)
    puts "|#{a[index]}|#{number2}| |"
    index +=1
    b.push(number2)
  end
  
  gets.chomp
  puts "-----------------------"
  index = 0
  3.times do 
    number3 = rand(5)
    puts "|#{a[index]}|#{b[index]}|#{number3}|"
    index +=1
    c.push(number3)
  end
  
  if a[1] == b[1] && b[1] == c[1]
    puts "-----------------------"
    puts "真ん中に#{a[1]}がそろいました"
    coin = coin_sheet * 100
    point = coin_sheet * 100
    puts "#{coin} コイン獲得"
    puts "#{point} ポイント獲得"
    return coin, point, true
  elsif a[0] == b[0] && b[0] == c[0]
    puts "-----------------------"
    puts "横に#{a[0]}がそろいました"
    coin = coin_sheet * 50
    point = coin_sheet * 50
    puts "#{coin} コイン獲得"
    puts "#{point} ポイント獲得"
    return coin, point, true
  elsif a[2] == b[2] && b[2] == c[2] 
    puts "-----------------------"
    puts "横に#{a[2]}がそろいました"
    coin = coin_sheet * 50
    point = coin_sheet * 50
    puts "#{coin} コイン獲得"
    puts "#{point} ポイント獲得"
    return coin, point, true
  elsif a[0] == b[1] && b[1] == c[2] or a[2] == b[1] && b[1] == c[0]
    puts "-----------------------"
    puts "斜めに#{b[1]}がそろいました"
    coin = coin_sheet * 30
    point = coin_sheet * 30
    puts "#{coin} コイン獲得"
    puts "#{point} ポイント獲得"
    return coin, point, true
  else
    puts "-----------------------"
    puts "残念"
    coin = -coin_sheet * 10
    point = coin_sheet * 0
    puts "#{coin} コイン"
    puts "#{point} ポイント獲得"
    return coin, point, true
  end
end


def slot_game(coin_sum, point_sum)
  
  coin = coin_sum
  point = point_sum
  
  if coin <= 0
    puts "-------------------------------------------"
    puts "コインが無くなりましたのでゲーム修了です"
    puts "合計 #{point} ポイントでした"
    puts "お疲れ様でした"
    puts "-------------------------------------------"
    coin = 0
    point = 0
    return coin, point, false
  end
  
  puts "-----------------------"
  puts "残りコイン #{coin} 枚"
  puts "合計 #{point} ポイント"
  puts "何コイン入れますか？"
  puts "1(10コイン), 2(20コイン), 3(30コイン), 4(やめとく)"
   
  roulette(coin, point)
  
end


next_game = true
coin_sum = 100
point_sum = 0
while next_game do
  slot = slot_game(coin_sum, point_sum)
  coin_sum += slot[0]
  point_sum += slot[1]
  next_game = slot[2]
end