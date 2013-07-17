class PassingStat
  include DataMapper::Resource

  property :id, Serial
  property :qbRat, Float
  property :comp, Integer
  property :att, Integer
  property :pct, Float
  property :yds, Integer
  property :yardsPerGame, Float
  property :yardsPerAtt, Float
  property :td, Integer
  property :int, Integer

  belongs_to :player
end