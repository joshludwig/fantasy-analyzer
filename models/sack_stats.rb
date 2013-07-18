class SackStat
  include DataMapper::Resource

  property :id, Serial
  property :sack, Integer
  property :ydsL, Integer

  belongs_to :player
end