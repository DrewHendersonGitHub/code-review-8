require 'rspec'
require 'word_definer'
require 'pry'

describe '#Word' do

  before(:each) do
    Word.clear()
  end

  describe('.all') do
    it("returns an empty array when there are no stored words") do
      expect(Word.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a word") do
      word = Word.new(name: "dog")
      word.save()
      word2 = Word.new(name: "Frog")
      word2.save()
      expect(Word.all).to(eq([word, word2]))
    end
  end

  describe('#==') do
    it("two words are equal if they have the same attributes as each other") do
      word = Word.new(name: "cat")
      word2 = Word.new(name: "cat")
      expect(word).to(eq(word2))
    end
  end

  describe('.clear') do
    it("clears all words") do
      word = Word.new(name: "hello")
      word.save()
      Word.clear()
      expect(Word.all).to(eq([]))
    end
  end

  describe('.find') do
    it("finds a word by its id") do
      word = Word.new(name: "table")
      word.save()
      word2 = Word.new(name: "ball")
      word2.save()
      expect(Word.find(word.id)).to(eq(word))
    end
  end

  describe('#update') do
    it("updates a word by id") do
      word = Word.new(name: "recieve")
      word.save()
      word.update("receive")
      expect(word.name).to(eq("receive"))
    end
  end

end