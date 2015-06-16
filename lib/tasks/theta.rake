# MO. H. Entrepreneur, CO-Founder & CEO at oxygenarabi.com
# 
# Theta scraper runs once/week

namespace :theta do
  
  require "open-uri"
  require "nokogiri"
  
  
  # 1st task, theta1 once/week on Sunday at 11:00am
  desc " Fetch data from theta1 sources"
  task theta1: :environment do 
    
    # business, arageek.com
    # 
    #1 Fetch the website data
    arageek = "http://www.arageek.com"
    arageek_url = open("http://www.arageek.com/category/business")
    arageek_doc = Nokogiri::HTML(arageek_url)
    
    begin
      #2 Assign variables to the fetched data
      #arageek_image = arageek_doc.css('div.c5-thumb-hover.clearfix a img')[0]['src']
      #arageek_image = arageek + arageek_image unless arageek_image.include?"http://"
      arageek_image = "money.jpg"
      arageek_headline = arageek_doc.css('div.content a')[0].text
      arageek_desc = arageek_doc.css('div.content p')[0].text
      arageek_source = "arageek.jpeg"
      arageek_link = arageek_doc.css('div.content a')[0]['href']
      arageek_link = arageek + arageek_link unless arageek_link.include?"http://"
    
      #3 Add data to posts database
      if (Post.find_by(headline: arageek_headline).nil?) && (Post.find_by(image: arageek_image).nil?)
        @post = Post.new
        @post.category_id = 2
        @post.image = arageek_image
        @post.headline = arageek_headline
        @post.description = arageek_desc
        @post.source = arageek_source
        @post.source_url = arageek_link
        #4 Save data in posts table
        @post.save
      end # if statement
    rescue
    end # rescue
    
    #*************************************************************************************************

    # Business, digital.aglaam
    #
    #1 Fetch the website data
      argaam = "http://digital.argaam.com"
      argaam_url = open("http://digital.argaam.com/article/listbytags/77337/%D9%85%D8%B4%D8%A7%D8%B1%D9%8A%D8%B9-%D9%88%D8%A7%D8%B9%D8%AF%D8%A9/1")
      argaam_doc = Nokogiri::HTML(argaam_url)
    
      begin
      #2 Assign variables to the fetched data
      argaam_image = argaam_doc.css('a.entry-thumbnails-link img')[0]['src']
      arqaam_image = argaam + arqaam_image unless argaam_image.include? "http://"
      argaam_headline = argaam_doc.css('h3.entry-title a')[0].text
      argaam_desc = argaam_doc.css('div.entry-info')[0].next_sibling.text.strip
      argaam_source = "digital.argaam.jpeg"
      argaam_link = argaam_doc.css('h3.entry-title a')[0]['href']
      argaam_link = argaam + argaam_link unless argaam_link.include? "http://"
    
      #3 Add data to posts database
      if (Post.find_by(headline: argaam_headline).nil?) && (Post.find_by(image: argaam_image).nil?)
        @post = Post.new
        @post.category_id = 2
        @post.image = argaam_image
        @post.headline = argaam_headline
        @post.description = argaam_desc
        @post.source = argaam_source
        @post.source_url = argaam_link
        #4 Save data in posts table
        @post.save
      end # if statement
    rescue
    end # rescue
  end # theta1
  
end # namespace