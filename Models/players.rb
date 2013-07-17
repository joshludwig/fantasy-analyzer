class Player
  include DataMapper::Resource

  property :id, Serial
  property :firstName, String
  property :lastName, String
  property :position, Enum[:QB, :RB, :WR, :TE, :DE]

  has n, :passing_stats
end