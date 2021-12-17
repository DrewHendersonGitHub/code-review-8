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
  
  def ==(word2)
    self.name.eql?(word2.name)
  end

  def self.clear
    @@words = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@words[id]
  end

  def update(name)
    @name = name
  end

end