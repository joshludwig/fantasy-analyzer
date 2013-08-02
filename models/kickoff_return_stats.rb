class KickoffReturnStat
  include DataMapper::Resource

  property :id, Serial
  property :kickReturns, Integer
  property :yards, Integer
  property :average, Float
  property :long, Integer
  property :td, Integer

  belongs_to :player
end