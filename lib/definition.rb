class Definition

  attr_reader :id
  attr_accessor :name, :word_id

  @@definitions = {}
  @@total_rows = 0

  def initialize(attributes)
    @name = attributes[:name]
    @word_id = attributes[:word_id]
    @id = attributes[:id] || @@total_rows += 1
  end

  def self.all
    @@definitions.values
  end

  def save
    @@definitions[self.id] = Definition.new(name: self.name, word_id: self.word_id, id: self.id)
  end

  def ==(definition_to_compare)
    (self.name() == definition_to_compare.name()) && (self.word_id() == definition_to_compare.word_id())
  end

  def self.clear
    @@definitions = {}
  end

  def self.find(id)
    @@definitions[id]
  end

  def update(name, word_id)
    self.name = name
    self.word_id = word_id
    @@definitions[self.id] = Definition.new(name: self.name, word_id: self.word_id, id: self.id)
  end

  def delete
    @@definitions.delete(self.id)
  end
  
  def word
    Word.find(self.word_id)
  end
  
  def self.find_by_word(wordid)
    definitions = []
    @@definitions.values.each do |definition|
      if definition.word_id == wordid
        definitions.push(definition)
      end
    end
    definitions
  end
 
end