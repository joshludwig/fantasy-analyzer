class Application < Sinatra::Base
  get '/bulkload/qb' do
    qb_stats = Bulkload::get_stats 'QB'

    for i in 2...qb_stats.size
      player = qb_stats[i]
      puts player.inspect
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
      player = rb_stats[i]
      puts player.inspect
      #load data into variables for readability
      new_player = Bulkload::load_player(player[0..2])
      Bulkload::rushing_stats(player[5..9], new_player)
      Bulkload::receiving_stats(player[12..20], new_player)
      Bulkload::fumble_stats(player[23..24], new_player)
    end

    #Example: Searches for Staffords passing yards
    #player = Player.all(:lastName => 'Stafford')
    #puts player[0].passing_stats[0].yds

    haml :bulkload
  end

  get '/bulkload/wr' do
    wr_stats = Bulkload::get_stats 'WR'

    for i in 2...wr_stats.size
      player = wr_stats[i]
      puts player.inspect
      #load data into variables for readability
      new_player = Bulkload::load_player(player[0..2])
      Bulkload::receiving_stats(player[5..13], new_player)
      Bulkload::kickoff_return_stats(player[16..20], new_player)
      Bulkload::punt_return_stats(player[23..27], new_player)
      Bulkload::fumble_stats(player[30..31], new_player)
    end

    #Example: Searches for Staffords passing yards
    #player = Player.all(:lastName => 'Stafford')
    #puts player[0].passing_stats[0].yds

    haml :bulkload
  end

  get '/bulkload/te' do
    te_stats = Bulkload::get_stats 'TE'

    for i in 2...te_stats.size
      player = te_stats[i]
      puts player.inspect
      #load data into variables for readability
      new_player = Bulkload::load_player(player[0..2])
      Bulkload::receiving_stats(player[5..13], new_player)
      Bulkload::rushing_stats(player[16..20], new_player)
      Bulkload::fumble_stats(player[23..24], new_player)
    end

    #Example: Searches for Staffords passing yards
    #player = Player.all(:lastName => 'Stafford')
    #puts player[0].passing_stats[0].yds

    haml :bulkload
  end
end
