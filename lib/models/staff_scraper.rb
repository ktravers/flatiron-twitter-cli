require 'open-uri'
require 'nokogiri'

class StaffScraper

  def call
    html = open("http://flatironschool.com/team")
    staff_doc = Nokogiri::HTML(html)

    staff_doc.search('#staff div:nth-child(2) div.person-box').collect do |member|
      name = member.search('h2').text
      role = member.search('strong.title').text

      social = member.search('ul.social-networks li a').collect { |link| link['href'] }
      twitter = social.select { |link| link.include?("twitter") == true}.first

      if twitter != nil
        twitter = twitter.gsub(/(http:\/\/twitter.com\/|https:\/\/twitter.com\/)/,"@")
      else
        twitter = "@flatironschool"
      end

      Staff.new.tap do |staff|
        staff.name = name
        staff.twitter = twitter
        staff.role = role
      end
    end
  end

end
