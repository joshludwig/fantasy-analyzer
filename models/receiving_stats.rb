class ReceivingStat
  include DataMapper::Resource

  property :id, Serial
  property :receptions, Integer
  property :target, Integer
  property :yards, Float
  property :yardsPerGame, Float
  property :average, Integer
  property :long, Integer
  property :yardsAfterCatch, Integer
  property :firstDown, Integer
  property :td, Integer


  belongs_to :player

end