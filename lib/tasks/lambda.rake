# MO. H. Internet Entrpreneur, CO-Founder & CEO at oxygenarabi.com
# 
# Lambda scrpaer runs everyday btw 6:00pm - 9:59pm UTC. 

namespace :lambda do 
  require 'nokogiri'
  require 'open-uri'
  
  # 1st task, lambda1 everyday at 6:00pm
  desc " Fetch data from lambda1 sources"
  task lambda1: :environment do 
    
    # Politics, www.aljazeera.net
    #
    #1 Fetch the website data
    aljazeera = "http://www.aljazeera.net"
    aljazeera_url = open("http://www.aljazeera.net/news")
    aljazeera_doc = Nokogiri::HTML(aljazeera_url)
    
    begin
      #2 Assign variables to the fetched data
      aljazeera_image = aljazeera_doc.css('div.float-right-news img')[0]['src']
      aljazeera_image = aljazeera + aljazeera_image unless aljazeera_image.include? "http://"
      aljazeera_headline = aljazeera_doc.css('div.float-right-news img')[0]['title']
      aljazeera_desc = aljazeera_doc.css('div.d2.d-overlap.d2d-overlap-modification time')[0].next_sibling.text
      aljazeera_desc = aljazeera_desc.strip
      aljazeera_source = "aljazeeralogl.ico"
      aljazeera_link = aljazeera_doc.css('h1.float-heading-news a')[0]['href']
      aljazeera_link = aljazeera + aljazeera_link
    
      #3 Add data to posts database
      if (Post.find_by(headline: aljazeera_headline).nil?) && (Post.find_by(image: aljazeera_image).nil?)
        @post = Post.new
        @post.category_id = 3
        @post.image = aljazeera_image
        @post.headline = aljazeera_headline
        @post.description = aljazeera_desc
        @post.source = aljazeera_source
        @post.source_url = aljazeera_link
        #4 Save data in posts table
        @post.save
      end # if statement
    rescue
    end # rescue
    #*************************************************************************************************
    
    # Politics, Alarabalyawm
    #
    #1 Fetch the website data
    alarabalyawm = "http://alarabalyawm.net"
    alarabalyawm_url = open("http://alarabalyawm.net/?cat=83")
    alarabalyawm_doc = Nokogiri::HTML(alarabalyawm_url)
    
    begin
      #2 Assign variables to the fetched data
      alarabalyawm_image = alarabalyawm_doc.css('div.post-thumb a img')[0]['src']
      alarabalyawm_image = alarabalyawm + alarabalyawm_image unless alarabalyawm_image.include? "http://"
      alarabalyawm_headline = alarabalyawm_doc.css('h2.post-title a')[0].text
      alarabalyawm_desc = alarabalyawm_doc.css('div.teaser-body.clear.clearfix p')[0].text
      alarabalyawm_source = "http://alarabalyawm.net/wp-content/themes/alarabalyawm/logo.png"
      alarabalyawm_link = alarabalyawm_doc.css('h2.post-title a')[0]['href']
      alarabalyawm_link = alarabalyawm + alarabalyawm_link unless alarabalyawm_link.include? "http://"
     
      #3 Add data to posts database
      if (Post.find_by(headline: alarabalyawm_headline).nil?) && (Post.find_by(image: alarabalyawm_image).nil?)
        @post = Post.new
        @post.category_id = 3
        @post.image = alarabalyawm_image
        @post.headline = alarabalyawm_headline
       @post.description = alarabalyawm_desc
        @post.source = alarabalyawm_source
        @post.source_url = alarabalyawm_link
        #4 Save data in posts table
        @post.save
      end # if statement  
    rescue
    end # rescue
      
    #*************************************************************************************************
    
    # Politics, BBC arabic
    #
    #1 Fetch the website data
    bbc = "http://www.bbc.co.uk"
    bbc_url = open("http://www.bbc.co.uk/arabic")
    bbc_doc = Nokogiri::HTML(bbc_url)
    
    begin
      #2 Assign variables to the fetched data
      bbc_image = bbc_doc.css('div.responsive-image.responsive-image--16by9 img')[0]['src']
      bbc_image = bbc+ bbc_image unless bbc_image.include? "http://"
      bbc_headline = bbc_doc.css('h3.hard-news-unit__headline a')[0].text.strip
      bbc_desc = bbc_doc.css('p.hard-news-unit__summary')[0].text
      bbc_source = bbc_doc.css('div.orb-nav-section.orb-nav-blocks a img')[0]['src']
      bbc_link = bbc_doc.css('h3.hard-news-unit__headline a')[0]['href']
      bbc_link = bbc + bbc_link unless bbc_link.include? "http://"
    
      #3 Add data to posts database
      if (Post.find_by(headline: bbc_headline).nil?) && (Post.find_by(image: bbc_image).nil?)
        @post = Post.new
        @post.category_id = 3
        @post.image = bbc_image
        @post.headline = bbc_headline
       @post.description = bbc_desc
        @post.source = bbc_source
        @post.source_url = bbc_link
        #4 Save data in posts table
        @post.save
      end # if statement
    rescue
    end # rescue
      
    #*************************************************************************************************
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
    
  end # lambda1 task
end # namespace lambda

