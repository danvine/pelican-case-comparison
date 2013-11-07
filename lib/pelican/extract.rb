# encoding: utf-8

require 'nokogiri'
require 'open-uri'

module Pelican
  def self.extract
    doc = Nokogiri::HTML(open('./cache/all.html'))

    products = []
    doc.css('table.ccdata').each do |table|

      product = {}

      product[:label] = table.css('a')[1].content.gsub("™","")
      product[:slug] = product[:label].to_s.downcase.gsub(' ','-')

      dimensions = table.css('.pdlc').first.css('span.ueng')
      product[:length] = ("%.2f" % (dimensions[0].content.to_s.gsub("\"",'').to_f * 2.54)).to_f
      product[:width]  = ("%.2f" % (dimensions[1].content.to_s.gsub("\"",'').to_f * 2.54)).to_f
      product[:height] = ("%.2f" % (dimensions[2].content.to_s.gsub("\"",'').to_f * 2.54)).to_f

      product[:volume] = product[:length] * product[:width] * product[:height]
      product[:model] = product[:label].to_s.split(/\s+/).last

      products << product

    end
    return products
  end
end