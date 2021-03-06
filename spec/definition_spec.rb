require 'rspec'
require 'pry'
require 'word'
require 'definition'

describe '#Definition' do

  before(:each) do
    Word.clear()
    Definition.clear()
    @word = Word.new(name: "taco")
    @word.save()
  end

  describe('#==') do
    it("two definitions are equal if they have the same attributes") do
      definition = Definition.new(name: "a taco is a tortilla sandwich", word_id: @word.id)
      definition2 = Definition.new(name: "a taco is a tortilla sandwich", word_id: @word.id)
      expect(definition).to(eq(definition2))
    end
  end

  describe('.all') do
    it("returns an array of all definitions") do
      definition = Definition.new(name: "it's a taco", word_id: @word.id)
      definition.save()
      definition2 = Definition.new(name: "a taco is a tortilla sandwich", word_id: @word.id)
      definition2.save()
      expect(Definition.all).to(eq([definition, definition2]))
    end
  end

  describe('.clear') do
    it("clears all definitions") do
      definition = Definition.new(name: "a taco is a tortilla sandwich", word_id: @word.id)
      definition.save()
      definition2 = Definition.new(name: "a taco is a tortilla sandwich", word_id: @word.id)
      definition2.save()
      Definition.clear()
      expect(Definition.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a definition") do
      definition = Definition.new(name: "a taco is a tortilla sandwich", word_id: @word.id)
      definition.save()
      expect(Definition.all).to(eq([definition]))
    end
  end

  describe('.find') do
    it("finds a definition by id") do
      definition = Definition.new(name: "a taco is a tortilla sandwich", word_id: @word.id)
      definition.save()
      definition2 = Definition.new(name: "it's a taco", word_id: @word.id)
      definition2.save()
      expect(Definition.find(definition.id)).to(eq(definition))
    end
  end

  describe('#update') do
    it("updates an definition by id") do
      definition = Definition.new(name: "a taco is a tortilla sandwich", word_id: @word.id)
      definition.save()
      definition.update("it's a taco", @word.id)
      expect(definition.name).to(eq("it's a taco"))
    end
  end

  describe('#delete') do
    it("deletes an definition by id") do
      definition = Definition.new(name: "a taco is a tortilla sandwich", word_id: @word.id)
      definition.save()
      definition2 = Definition.new(name: "a taco is a tortilla sandwich", word_id: @word.id)
      definition2.save()
      definition.delete()
      expect(Definition.all).to(eq([definition2]))
    end
  end

  describe('.find_by_word') do
    it("finds definition for an word") do
      word2 = Word.new(name: "burrito")
      word2.save
      definition = Definition.new(name: "a taco is a tortilla sandwich", word_id: @word.id)
      definition.save()
      definition2 = Definition.new(name: "burrito definition", word_id: word2.id)
      definition2.save()
      expect(Definition.find_by_word(word2.id)).to(eq([definition2]))
    end
  end

  describe('#word') do
    it("finds the word a definition belongs to") do
      definition = Definition.new(name: "a taco is a tortilla sandwich", word_id: @word.id)
      definition.save()
      expect(definition.word()).to(eq(@word))
    end
  end
  
end