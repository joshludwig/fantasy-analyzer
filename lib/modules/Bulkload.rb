module Bulkload

  def self.get_stats(position)
    stats = Array.new
    CSV.foreach("data/#{position}.csv") do |row|
      stats.push row
    end
    stats.each do |row|
      puts "Row inspect = #{row.inspect}"
      puts "Row size = #{row.size}"
    end

    #Replace N/A's with 0's
    stats.each do |player|
      player.each do |cell|
        if !cell.nil?
          cell.gsub!(/.*N\/A.*/, '0') #Regex needed bacause some but not all N/A's have trailing spaces
        end
      end
    end

    stats
  end

  def self.load_player(player)
    #load data into variables for readability
    #player = qb_stats[i]
    first_name = player[0].split(' ')[0]
    last_name = player[0].split(' ')[1]
    team = player[1]
    position = :QB
    games_played = player[2].to_i

#Create new player row
    new_player = Player.create(:firstName => first_name, :lastName => last_name, :team => team, :position => position, :gamesPlayed => games_played)
    new_player.save
    new_player
  end

  def self.passing_stats(stats, new_player)
    #Load passing stats into variables
    qbRat = stats[0]
    comp = stats[1]
    att = stats[2]
    pct = stats[3]
    yds = stats[4]
    yardsPerGame = stats[5]
    yardsPerAtt = stats[6]
    td = stats[7]
    int = stats[8]
    new_passing_stats = PassingStat.create(:qbRat => qbRat, :comp => comp, :att => att, :pct => pct, :yds => yds, :yardsPerGame => yardsPerGame, :yardsPerAtt => yardsPerAtt, :td => td, :int => int, :player => new_player)
    new_passing_stats.save
  end

  def self.rushing_stats(stats, new_player)
    #Load rushing stats into variables
    rushAtt = stats[0]
    yds = stats[1]
    yardsPerGame = stats[2]
    avg = stats[3]
    td = stats[4]
    new_rushing_stats = RushingStat.create(:rushAtt => rushAtt, :yds => yds, :yardsPerGame => yardsPerGame, :avg => avg, :td => td, :player => new_player)
    new_rushing_stats.save
  end

  def self.receiving_stats(stats, new_player)
    receptions = stats[0]
    target = stats[1]
    yards = stats[2]
    yardsPerGame = stats[3]
    average = stats[4]
    long = stats[5]
    yardsAfterCatch = stats[6]
    firstDown = stats[7]
    td = stats[8]
    new_receiving_stats = ReceivingStat.create(:receptions => receptions, :target => target, :yards => yards, :yardsPerGame => yardsPerGame, :average => average, :long => long, :yardsAfterCatch => yardsAfterCatch, :firstDown => firstDown, :td => td,:player => new_player)
    new_receiving_stats.save
  end

  def self.sacked_stats(stats, new_player)
    #Load sacked stats into variables
    sack = stats[0]
    ydsL = stats[1]
    new_sack_stat = SackStat.create(:sack => sack, :ydsL => ydsL, :player => new_player)
    new_sack_stat.save
  end

  def self.fumble_stats(stats, new_player)
    #Load fumbled stats into variables
    fum = stats[0]
    fumL = stats[1]
    new_fumble_stat = FumbleStat.create(:fum => fum, :fumL => fumL, :player => new_player)
    new_fumble_stat.save
  end

  def self.kickoff_return_stats(stats, new_player)
    kickReturns = stats[0]
    yards = stats[1]
    average = stats[2]
    long = stats[3]
    td = stats[4]
    new_kickoff_return_stats = KickoffReturnStat.create(:kickReturns => kickReturns, :yards => yards, :average => average, :long => long, :td => td, :player => new_player)
    new_kickoff_return_stats.save
  end

  def self.punt_return_stats(stats, new_player)
    puntReturns = stats[0]
    yards = stats[1]
    average = stats[2]
    long = stats[3]
    td = stats[4]
    new_punt_return_stats = PuntReturnStat.create(:puntReturns => puntReturns, :yards => yards, :average => average, :long => long, :td => td, :player => new_player)
    new_punt_return_stats.save
  end
end










