class WordCounter
  def count(text)
    raise 'Text is required' if text.empty?
    return text.split.count
  end
end