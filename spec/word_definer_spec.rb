require 'rspec'
require 'word_definer'
require 'pry'

describe '#Word' do

  describe('.all') do
    it("returns an empty array when there are no stored words") do
      expect(Word.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a word") do
      word = Word.new("Giant Steps", nil)
      word.save()
      word2 = Word.new("Blue", nil)
      word2.save()
      expect(Word.all).to(eq([word, word2]))
    end
  end

end