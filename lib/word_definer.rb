class Word
  
  attr_accessor :name, :id

  @@words = {}
  @@total_rows = 0

  def initialize(attributes)
    @name = attributes[:name]
    @id = attributes[:id] || @@total_rows += 1
  end

  def self.all
    @@words.values()
  end

  def save
    @@words[self.id] = Word.new(name: self.name, id: self.id)
  end
end