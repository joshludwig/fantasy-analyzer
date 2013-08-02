class Application < Sinatra::Base
  get '/bulkload/qb' do
    qb_stats = Bulkload::get_stats 'QB'

    for i in 2...qb_stats.size
      player = qb_stats[i]
      #load data into variables for readability
      new_player = Bulkload::load_player(player[0..2])
      Bulkload::passing_stats(player[3..11], new_player)
      Bulkload::rushing_stats(player[12..16], new_player)
      Bulkload::sacked_stats(player[17..18], new_player)
      Bulkload::fumble_stats(player[19..20], new_player)
    end

    #Example: Searches for Staffords passing yards
    #player = Player.all(:lastName => 'Stafford')
    #puts player[0].passing_stats[0].yds

    haml :bulkload
  end

  get '/bulkload/rb' do
    rb_stats = Bulkload::get_stats 'RB'

    for i in 2...rb_stats.size
      #load data into variables for readability
      player = rb_stats[i]
      first_name = player[0].split(' ')[0]
      last_name = player[0].split(' ')[1]
      team = player[1]
      position = :RB
      games_played = player[2].to_i

      #Create new player row
      new_player = Player.create(:firstName => first_name, :lastName => last_name, :team => team, :position => position, :gamesPlayed => games_played)
      new_player.save

      #Load rushing stats into variables
      rushAtt = player[3]
      yds = player[4]
      yardsPerGame = player[5]
      avg = player[6]
      td = player[7]
      new_rushing_stats = RushingStat.create(:rushAtt => rushAtt, :yds => yds, :yardsPerGame => yardsPerGame, :avg => avg, :td => td, :player => new_player)
      new_rushing_stats.save

      #load recieving stats

    end

    #Example: Searches for Staffords passing yards
    #player = Player.all(:lastName => 'Stafford')
    #puts player[0].passing_stats[0].yds

    haml :bulkload
  end

  get '/bulkload/wr' do

  end

  get '/bulkload/te' do

  end
end


##load data into variables for readability
#player = qb_stats[i]
#puts player.inspect
#first_name = player[0].split(' ')[0]
#last_name = player[0].split(' ')[1]
#team = player[1]
#position = :QB
#games_played = player[2].to_i
#
##Create new player row
#new_player = Player.create(:firstName => first_name, :lastName => last_name, :team => team, :position => position, :gamesPlayed => games_played)
#new_player.save
#
##Load passing stats into variables
#qbRat = player[3]
#comp = player[4]
#att = player[5]
#pct = player[6]
#yds = player[7]
#yardsPerGame = player[8]
#yardsPerAtt = player[9]
#td = player[10]
#int = player[11]
#new_passing_stats = PassingStat.create(:qbRat => qbRat, :comp => comp, :att => att, :pct => pct, :yds => yds, :yardsPerGame => yardsPerGame, :yardsPerAtt => yardsPerAtt, :td => td, :int => int, :player => new_player)
#new_passing_stats.save
#
##Load rushing stats into variables
#rushAtt = player[12]
#yds = player[13]
#yardsPerGame = player[14]
#avg = player[15]
#td = player[16]
#new_rushing_stats = RushingStat.create(:rushAtt => rushAtt, :yds => yds, :yardsPerGame => yardsPerGame, :avg => avg, :td => td, :player => new_player)
#new_rushing_stats.save
#
##Load sacked stats into variables
#sack = player[17]
#ydsL = player[18]
#new_sack_stat = SackStat.create(:sack => sack, :ydsL => ydsL, :player => new_player)
#new_sack_stat.save
#
##Load fumbled stats into variables
#fum = player[19]
#fumL = player[20]
#new_fumble_stat = FumbleStat.create(:fum => fum, :fumL => fumL, :player => new_player)
#new_fumble_stat.save