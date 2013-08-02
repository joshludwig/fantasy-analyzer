class Player
  include DataMapper::Resource

  property :id, Serial
  property :firstName, String
  property :lastName, String
  property :team, String
  property :position, Enum[:QB, :RB, :WR, :TE, :DE]
  property :gamesPlayed, Integer

  has n, :passing_stats
  has n, :rushing_stats
  has n, :sack_stats
  has n, :fumble_stats
  has n, :receiving_stats
end