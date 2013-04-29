require 'full_tang/core_ext/string'

module Ace
  module Base
    class Case
    end
  end
end

describe String do
  describe '#constantize' do
    before(:each) do
      @string_consts = {
        Ace             => "Ace",
        Ace::Base       => "Ace::Base",
        Ace::Base::Case => "Ace::Base::Case"
      }
    end
    
    it 'should convert string representations of constants to their constant versions' do
      @string_consts.each { |const, string| string.constantize.should eq const }
    end

    it 'should raise NameError for undefined constants' do
      expect {"UndefinedModule::UndefinedClass".constantize} .to raise_exception(NameError)
    end

    it 'should strip away leading "::" and ignore them' do
      @string_consts.each { |const, string| "::#{string}".constantize.should eq const }
    end
  end
end
