class RushingStat
  include DataMapper::Resource

  property :id, Serial
  property :rushAtt, Integer
  property :yds, Integer
  property :yardsPerGame, Float
  property :avg, Float
  property :td, Integer

  belongs_to :player
end