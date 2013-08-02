class ReceivingStat
  include DataMapper::Resource

  property :id, Serial
  property :rec, Integer
  property :tgt, Integer
  property :yds, Integer
  property :yardsPerGame, Float
  property :avg, Float
  property :lng, Integer
  property :yac, Float
  property :firstDowns, Integer
  property :td, Integer

  belongs_to :player
end