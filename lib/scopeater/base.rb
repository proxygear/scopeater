module Scopeater
  class Base
    include Behaviour
    attr_reader :content, :taste

    def initialize content, taste=nil
      self.taste = taste || self.class.taste_of(content)
      self.content = content
    end

    def method_missing method, *args, &block
      tasty_content = content.send method, *args, &block
      if like? tasty_content
        self.content = tasty_content
        self
      else
        tasty_content
      end
    end

    def refocus_on taste
      if self.taste == taste
        self
      else
        self.class.new content, taste
      end
    end

    def like? content
      _taste = self.class.taste_of(content)
      _taste && _taste == self.taste
    end
  protected
    attr_writer :content, :taste
  end
end