require 'rspec'
require 'word_definer'
require 'pry'

describe '#Word' do

  

  describe('.all') do
    it("returns an empty array when there are no stored words") do
      expect(Word.all).to(eq([]))
    end
  end
end