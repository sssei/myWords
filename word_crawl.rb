require_relative './common.rb'
require 'open-uri'

def fetch_html(url)
  sleep 1
  open(url).read
end

def word_crawl(url)
  doc = Nokogiri::HTML.parse(fetch_html(url))
  audio_src = doc.at_css('.dpron-i source')[:src] if doc.at_css('.dpron-i source')
  audio_url = URI.join(url, audio_src).to_s
  dictionary = doc.at_css('.dictionary')
  dictionary.css('.dsense').map { |item| 
    p item.at_css('.ddef_d').text
  }
end

search_word = ARGV[0]
base_url = 'https://dictionary.cambridge.org/us/dictionary/english/'

if search_word.split.size == 1
  site_url = URI.join(base_url, search_word)
  word_crawl(site_url)
else
  
end


