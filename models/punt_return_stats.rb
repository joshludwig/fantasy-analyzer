class PuntReturnStat
  include DataMapper::Resource

  property :id, Serial
  property :pr, Integer
  property :yds, Integer
  property :avg, Float
  property :lng, Integer
  property :td, Integer

  belongs_to :player
end