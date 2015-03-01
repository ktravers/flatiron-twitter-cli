class InstructorScraper

  def call
    html = open("http://flatironschool.com/team")
    instructor_doc = Nokogiri::HTML(html)

    instructor_doc.search("section#instructors div.person-box").collect do |member|
      name = member.search("h2").text
      role = member.search('strong.title').text

      social = member.search("ul.social-networks li a").collect { |link| link['href'] }
      twitter = social.select { |link| link.include?("twitter") == true}.first

      if twitter != nil
        twitter = twitter.gsub(/(http:\/\/twitter.com\/|https:\/\/twitter.com\/)/,"@")
      else
        twitter = "@flatironschool"
      end

      Instructor.new.tap do |instructor|
        instructor.name = name
        instructor.twitter = twitter
        instructor.role = role
      end
    end
  end

end