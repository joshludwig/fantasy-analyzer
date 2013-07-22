class Interceptiontat
  include DataMapper::Resource

  property :id, Serial
  property :int, Integer
  property :yds, Integer
  property :intTD, Integer

  belongs_to :player
end