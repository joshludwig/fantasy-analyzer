class TackleStat
  include DataMapper::Resource

  property :id, Serial
  property :solo, Integer
  property :ast, Integer
  property :total, Float

  belongs_to :player
end