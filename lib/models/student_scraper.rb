class StudentScraper
  attr_accessor :urls

  def scrape_all_urls
    index_html = open("http://ruby007.students.flatironschool.com/")
    index_doc = Nokogiri::HTML(index_html)
    @urls = index_doc.search("h3 a").collect { |e| e['href'] }
  end

  def scrape_students
    @urls.collect { |url| scrape_student(url) }
  end

  def scrape_student(url)
    student_url = "http://ruby007.students.flatironschool.com/#{url}"
    student_html = open(student_url)
    student_doc = Nokogiri::HTML(student_html)

    Student.new.tap do |student|    
      student.name = student_doc.search("h4.ib_main_header").first.text
      student.twitter = student_doc.search("i.icon-twitter").first.parent["href"].gsub(/(http:\/\/twitter.com\/|https:\/\/twitter.com\/)/,"@")
    end
  end

  def call
    scrape_all_urls
    scrape_students
  end
end