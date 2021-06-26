module Scraping
  require 'open-uri'
  require 'nokogiri'

  def set_scraping
    url = 'https://coronavirus.smartnews.com/jp/'

    charset = nil
    html = open(url) do |f|
      charset = f.charset
      f.read
    end

    doc = Nokogiri::HTML.parse(html, nil, charset)

    rows = {}

    doc.xpath("//section[@class='detailSec jp-prefecture-list-container']").css('tr').each do |node|
      rows[node.css('td[1]').text] = node.css('td[2]').text
    end
    
    rows.drop(1)

    return rows
  end
end