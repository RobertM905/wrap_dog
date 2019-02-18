require "wrap_dog/version"

module WrapDog
  class Error < StandardError; end
  def self.wrap(word, limit)
    if limit < 1
      raise ArgumentError, 'limit must be more that zero'
    end
    if word.nil?
      return ''
    end
    if word.length <= limit
      word
    else
      space = word.index(' ')
      if(!space.nil?)
        return word[0,space] + '\n' + wrap(word[space+1, word.length], limit)
      else
        return word[0,limit] + '\n' + wrap(word[limit,word.length], limit)
      end
    end
  end
  
end
