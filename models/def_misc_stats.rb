class DefMiscStat
  include DataMapper::Resource

  property :id, Serial
  property :defTD, Integer
  property :fFum, Integer
  property :intTD, Integer

  belongs_to :player
end