class FumbleStat
  include DataMapper::Resource

  property :id, Serial
  property :fum, Integer
  property :fumL, Integer

  belongs_to :player
end