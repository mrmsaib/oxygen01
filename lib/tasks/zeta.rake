# MO. H. Entrepreneur, CO-Founder & CEO at oxygenarabi.com
# 
# Zeta scraper runs once/2days

namespace :zeta do
  
  require "open-uri"
  require "nokogiri"
  
  
  # 1st task, zeta1 once/2days at 11:00am
  desc " Fetch data from zeta1 sources"
  task zeta1: :environment do 
    
    # Politics, alraialyoum
    # 
    #1 Fetch the website data
    raialyoum = "ttp://www.raialyoum.com"
    raialyoum_url = open("http://www.raialyoum.com/?cat=10")
    raialyoum_doc = Nokogiri::HTML(raialyoum_url)
    
    begin
      #2 Assign variables to the fetched data
      raialyoum_image = raialyoum_doc.css('h4[dir="RTL"] a img')[1]['src']
      raialyoum_image = raialyoum + raialyoum_image unless raialyoum_image.include? "http://"
      raialyoum_headline = raialyoum_doc.css('h1.post-title a')[0].text
      raialyoum_desc = raialyoum_headline
      raialyoum_source = "http://www.raialyoum.com/wp-content/uploads/2014/09/logonew.jpg"
      raialyoum_link = raialyoum_doc.css('h1.post-title a')[0]['href']
      raialyoum_link = raialyoum + raialyoum_link unless raialyoum_link.include? "http://"
    
      #3 Add data to posts database
      if (Post.find_by(headline: raialyoum_headline).nil?) && (Post.find_by(image: raialyoum_image).nil?)
        @post = Post.new
        @post.category_id = 3
        @post.image = raialyoum_image
        @post.headline = raialyoum_headline
        @post.description = raialyoum_desc
        @post.source = raialyoum_source
        @post.source_url = raialyoum_link
        #4 Save data in posts table
        @post.save
      end # if statement
    rescue
    end # rescue
    
    #*************************************************************************************************

    # Tech, thaqafnafsak
    #
    #1 Fetch the website data
    thaqafnafsak_tech = "http://www.thaqafnafsak.com"
    thaqafnafsak_tech_url = open("http://www.thaqafnafsak.com/tech")
    thaqafnafsak_tech_doc = Nokogiri::HTML(thaqafnafsak_tech_url)
    
    begin
      #2 Assign variables to the fetched data
      thaqafnafsak_tech_image = thaqafnafsak_tech_doc.css('figure.post-thumbnail a img')[0]['src']
      thaqafnafsak_tech_image = thaqafnafsak_tech + thaqafnafsak_tech_image unless thaqafnafsak_tech_image.include? "http://"
      thaqafnafsak_tech_headline = thaqafnafsak_tech_doc.css('h2.cat-grid-title a')[0].text
      thaqafnafsak_tech_desc = thaqafnafsak_tech_doc.css('div.entry-content.cat-grid-meta p')[0].text.strip
      thaqafnafsak_tech_source = "http://www.thaqafnafsak.com/wp-content/uploads/2014/12/th_logo.jpg"
      thaqafnafsak_tech_link = thaqafnafsak_tech_doc.css('figure.post-thumbnail a')[0]['href']
      thaqafnafsak_tech_link = thaqafnafsak_tech + thaqafnafsak_tech_link unless thaqafnafsak_tech_link.include? "http://"
    
      #3 Add data to posts database
      if (Post.find_by(headline: thaqafnafsak_tech_headline).nil?) && (Post.find_by(image: thaqafnafsak_tech_image).nil?)
        @post = Post.new
        @post.category_id = 4
        @post.image = thaqafnafsak_tech_image
        @post.headline = thaqafnafsak_tech_headline
       @post.description = thaqafnafsak_tech_desc
        @post.source = thaqafnafsak_tech_source
        @post.source_url = thaqafnafsak_tech_link
        #4 Save data in posts table
        @post.save
      end # if statement
    rescue
    end # rescue
    
    #*************************************************************************************************

    # Tech, techakhbar
    #
    #1 Fetch the website data
    techakhbar = "http://www.techakhbar.com"
    techakhbar_url = open("http://www.techakhbar.com/securty/index.html")
    techakhbar_doc = Nokogiri::HTML(techakhbar_url)
    
    begin
      #2 Assign variables to the fetched data
      techakhbar_image = techakhbar_doc.css('div.mask a img')[0]['src']
      techakhbar_image = techakhbar + techakhbar_image unless techakhbar_image.include? "http://"
      techakhbar_headline = techakhbar_doc.css('h2.h4 a')[5].text
      techakhbar_desc = techakhbar_doc.css('div.cb-excerpt')[0].text.strip
      techakhbar_source = "http://www.techakhbar.com/content/theme/logo.png"
      techakhbar_link = techakhbar_doc.css('h2.h4 a')[5]['href']
      techakhbar_link = techakhbar + techakhbar_link unless techakhbar_link.include? "http://"
    
      #3 Add data to posts database
      if (Post.find_by(headline: techakhbar_headline).nil?) && (Post.find_by(image: techakhbar_image).nil?)
        @post = Post.new
        @post.category_id = 4
        @post.image = techakhbar_image
        @post.headline = techakhbar_headline
       @post.description = techakhbar_desc
        @post.source = techakhbar_source
        @post.source_url = techakhbar_link
        #4 Save data in posts table
        @post.save
      end # if statement
    rescue
    end # rescue
    
    #*************************************************************************************************
    # Health, dailymedicalinfo
    #
    #1 Fetch the website data
    dailymedicalinfo = "http://www.dailymedicalinfo.com"
    dailymedicalinfo_url = open("http://www.dailymedicalinfo.com/news")
    dailymedicalinfo_doc = Nokogiri::HTML(dailymedicalinfo_url)
    
    begin
      #2 Assign variables to the fetched data
      dailymedicalinfo_image = dailymedicalinfo_doc.css('div.articleOne a img')[0]['data-src']
      dailymedicalinfo_image = dailymedicalinfo + dailymedicalinfo_image unless dailymedicalinfo_image.include? "http://"
      dailymedicalinfo_headline = dailymedicalinfo_doc.css('div.articleOne div h2 a')[0].text
      dailymedicalinfo_desc = dailymedicalinfo_doc.css('div.articleOne div h3')[0].text
      dailymedicalinfo_source = "http://www.dailymedicalinfo.com/images/logo.png"
      dailymedicalinfo_link = dailymedicalinfo_doc.css('div.articleOne a')[0]['href']
      dailymedicalinfo_link = dailymedicalinfo + dailymedicalinfo_link unless dailymedicalinfo_link.include? "http://" 
     
      #3 Add data to posts database
      if (Post.find_by(headline: dailymedicalinfo_headline).nil?) && (Post.find_by(image: dailymedicalinfo_image).nil?)
        @post = Post.new
        @post.category_id = 6
        @post.image = dailymedicalinfo_image
        @post.headline = dailymedicalinfo_headline
       @post.description = dailymedicalinfo_desc
        @post.source = dailymedicalinfo_source
        @post.source_url = dailymedicalinfo_link
        #4 Save data in posts table
        @post.save
      end # if statement
    rescue
    end # rescue
    
    #*************************************************************************************************

    # Science, arageek.com
    #
    #1 Fetch the website data
    arageek_science = "http://www.arageek.com"
    arageek_science_url = open("http://www.arageek.com/category/knowledge")
    arageek_science_doc = Nokogiri::HTML(arageek_science_url)
    
    begin
      #2 Assign variables to the fetched data
      arageek_science_image = arageek_science_doc.css('div.c5-thumb-hover a img')[0]['src']
      arageek_science_image = arageek_science + arageek_science_image unless arageek_science_image.include? "http://"
      arageek_science_headline = arageek_science_doc.css('div.content a')[0].text
      arageek_science_desc = arageek_science_doc.css('div.content p')[0].text
      arageek_science_source = "arageek.jpeg"
      arageek_science_link = arageek_science_doc.css('div.c5-thumb-hover a')[0]['href']
      arageek_science_link = arageek_science + arageek_science_link unless arageek_science_link.include? "http://"
    
      #3 Add data to posts database
      if (Post.find_by(headline: arageek_science_headline).nil?) && (Post.find_by(image: arageek_science_image).nil?)
        @post = Post.new
        @post.category_id = 5
        @post.image = arageek_science_image
        @post.headline = arageek_science_headline
        @post.description = arageek_science_desc
        @post.source = arageek_science_source
        @post.source_url = arageek_science_link
        #4 Save data in posts table
        @post.save
      end # if statement
    rescue
    end # rescue  
  end # zeta1
  
end # namespace