require 'wrap_dog'

describe WrapDog do 

  it 'wrap null returns empty string' do
    expect(WrapDog.wrap(nil, 10)).to eq('')
  end

  it 'wrap empty string returns empty string' do
    expect(WrapDog.wrap('', 10)).to eq('')
  end

  it 'returns a error if the limit is less that one' do 
    expect {WrapDog.wrap('word', 0)}.to raise_error(ArgumentError)

  end

  it 'does not wrap a word shorter then the limit' do
    expect(WrapDog.wrap('word', 5)).to eq('word')
  end

  it 'wraps a word that is longer than the limit' do
    expect(WrapDog.wrap('longword', 4)).to eq('long\nword')
    expect(WrapDog.wrap('longerword', 6)).to eq('longer\nword')
  end

  it 'wraps a word twice as long as limit twice' do
    expect(WrapDog.wrap('verylongword', 4)).to eq('very\nlong\nword')
  end

  it 'wraps two words that are longer then the limit' do
    expect(WrapDog.wrap('word word', 4)).to eq('word\nword')
  end

  it 'three words longer than limit should also wrap' do
    expect(WrapDog.wrap('word word word', 4)).to eq('word\nword\nword')
  end

 

end