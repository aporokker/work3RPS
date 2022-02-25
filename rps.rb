class Rpsgame
  def initialize()
    @rps = ["グー","チョキ","パー"]
    @playerhand == ""
    @rps_result = ""
    @look_this_way = ["上","下","左","右"]
    @playerdirection = ""
    @look_this_way_result = ""
  end

  def start_rps_game
    until @playerhand == "3" do
      if @rps_result == "draw" #あいこの時のみ掛け声は「「あいこで」しょ」
        puts "あいこで・・・"
      else
        puts "じゃんけん・・・"
      end

      puts "0(グー)1(チョキ)2(パー)3(やめる)"
      @playerhand = gets.to_s.chomp
      @enemyhand = rand(0..2)

      if @playerhand == "0" || @playerhand == "1" || @playerhand == "2"
        rps_winlose_judge()
        if @rps_result == "draw"
          next
        else #じゃんけんに勝ったor負けた場合、あっち向いてほいへ
          start_look_this_way_game()
          next
        end
      elsif @playerhand == "3"
        next
      else #0,1,2,3以外が入力されたらループのはじめに戻る
        next
      end
    end
      puts "ゲームを終了します"
      return
  end

  def rps_winlose_judge
    if @rps_result == "draw" #あいこの時のみ掛け声は「あいこで「しょ」」
      puts "しょ！"
    else
      puts "ぽい！"
    end

    @playerhand = @playerhand.to_i #配列の要素を呼び出すため数値型に変換
    puts "---------------"
    puts "あなた：#{@rps[@playerhand]}を出しました"
    puts "相手：#{@rps[@enemyhand]}を出しました"
    puts "---------------"

    case @playerhand
    when 0 #自分がグーのとき
      if @enemyhand == 0 #相手がグーのとき
        @rps_result = "draw"
      elsif @enemyhand == 1 #相手がチョキのとき
        @rps_result = "win"
      elsif @enemyhand == 2 #相手がパーのとき
        @rps_result = "lose"
      end
    when 1 #自分がチョキのとき
      if @enemyhand == 0 #相手がグーのとき
        @rps_result = "lose"
      elsif @enemyhand == 1 #相手がチョキのとき
        @rps_result = "draw"
      elsif @enemyhand == 2 #相手がパーのとき
        @rps_result = "win"
      end
    when 2 #自分がパーのとき
      if @enemyhand == 0 #相手がグーのとき
        @rps_result = "win"
      elsif @enemyhand == 1 #相手がチョキのとき
        @rps_result = "lose"
      elsif @enemyhand == 2 #相手がパーのとき
        @rps_result = "draw"
      end
    end
  end

  def start_look_this_way_game
    until @playerdirection == "0" || @playerdirection == "1" || @playerdirection == "2" || @playerdirection == "3" do
      puts "あっち向いて〜"
      puts "0(上)1(下)2(左)3(右)"
      @playerdirection = gets.to_s.chomp
    end
    @enemydirection = rand(0..3)
    puts "ほい！"

    @playerdirection = @playerdirection.to_i #配列の要素を呼び出すため数値型に変換
    puts "---------------"
    puts "あなた：#{@look_this_way[@playerdirection]}"
    puts "相手：#{@look_this_way[@enemydirection]}"
    puts "---------------"

    if @playerdirection == @enemydirection #自分と相手が同じ方向のとき
      if @rps_result == "win" #自分がじゃんけんに勝っていたとき
        @look_this_way_result = "win"
      elsif @rps_result == "lose" #自分がじゃんけんに負けていたとき
        @look_this_way_result = "lose"
      end
    else #自分と相手が違う方向のとき
      @look_this_way_result = "draw"
    end

    if @look_this_way_result == "win"
      puts "あなたの勝ち！"
    elsif @look_this_way_result == "lose"
      puts "あなたの負け〜"
    elsif @look_this_way_result == "draw"
    end
  end
end

rpsgame = Rpsgame.new()
rpsgame.start_rps_game
