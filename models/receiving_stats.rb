class ReceivingStat
  include DataMapper::Resource

  property :id, Serial
  property :receptions, Integer
  property :target, Integer
  property :yards, Integer
  property :yardsPerGame, Float
  property :average, Float
  property :long, Integer
  property :yardsAfterCatch, Float
  property :firstDown, Integer
  property :td, Integer


  belongs_to :player

end