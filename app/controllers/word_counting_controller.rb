class WordCountingController < ApplicationController

  def count
    @count = WordCounter.new.count(params[:text])
    render 'word_counting/index'
  rescue StandardError => e
    flash.now[:error] = e.message
    render 'word_counting/index'
  end
end
