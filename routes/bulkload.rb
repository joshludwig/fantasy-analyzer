class Application < Sinatra::Base
  get '/bulkload/qb' do
    qb_stats = Array.new
    CSV.foreach("data/QB.csv") do |row|
      qb_stats.push row
    end
    qb_stats.each do |row|
      puts "Row inspect = #{row.inspect}"
      puts "Row size = #{row.size}"
    end
    for i in 2...qb_stats.size
      #load data into variables for readability
      player = qb_stats[i]
      first_name = player[0].split(' ')[0]
      last_name = player[0].split(' ')[1]
      team = player[1]
      position = :QB
      games_played = player[2].to_i

      #Create new player row
      new_player = Player.create(:firstName => first_name, :lastName => last_name, :team => team, :position => position, :gamesPlayed => games_played)
      new_player.save

      #Load passing stats into variables
      qbRat = player[3]
      comp = player[4]
      att = player[5]
      pct = player[6]
      yds = player[7]
      yardsPerGame = player[8]
      yardsPerAtt = player[9]
      td = player[10]
      int = player[11]
      new_passing_stats = PassingStat.create(:qbRat => qbRat, :comp => comp, :att => att, :pct => pct, :yds => yds, :yardsPerGame => yardsPerGame, :yardsPerAtt => yardsPerAtt, :td => td, :int => int, :player => new_player)
    end

    #Example: Searches for Staffords passing yards
    #player = Player.all(:lastName => 'Stafford')
    #puts player[0].passing_stats[0].yds

    haml :bulkload
  end
end