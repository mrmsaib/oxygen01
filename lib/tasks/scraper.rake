# MO. H. Enterpreneur, Co-founder & CEO at OxygenArabi.com
#
 
namespace :scraper do
  #First Task!
  desc "Fetch Politics headlines"
  task scrape: :environment do
    
    require 'open-uri'
    require 'nokogiri'

    # www.aljazeera.net
    #1 Petch the website data
    aljazeera = "http://www.aljazeera.net"
    aljazeera_url = open("http://www.aljazeera.net/news")
    aljazeera_doc = Nokogiri::HTML(aljazeera_url)
 
    #2 pull Post controller information.
    aljazeera_image = aljazeera_doc.css('div.float-right-news img')[0]['src']
    aljazeera_image = aljazeera + aljazeera_image unless aljazeera_image.include? "http://"
    aljazeera_headline = aljazeera_doc.css('div.float-right-news img')[0]['title']
    aljazeera_description = aljazeera_doc.css('div.d2.d-overlap.d2d-overlap-modification time')[0].next_sibling.text
    aljazeera_description = aljazeera_description.strip
    #aljazeera_source = aljazeera_doc.css('img#footer-logo')[0]['src']
    #aljazeera_source = aljazeera + aljazeera_source
    aljazeera_link = aljazeera_doc.css('h1.float-heading-news a')[0]['href']
    aljazeera_link = aljazeera + aljazeera_link unless aljazeera_link.include? "http://"
 
    #3 Add data to posts database
    if Post.find_by(headline: aljazeera_headline).nil?
      @post = Post.new
      @post.image = aljazeera_image
      @post.headline = aljazeera_headline
      @post.description = aljazeera_description
      @post.source = "aljazeeralogl.ico"
      @post.source_url = aljazeera_link
      #4 Save data in posts table
      @post.save
    end # end if statement
    #*************************************************************************************************
    # BBCarabic
    #
    #1 Fetch the website data
    bbc = "http://www.bbc.co.uk"
    bbc_url = open("http://www.bbc.co.uk/arabic")
    bbc_doc = Nokogiri::HTML(bbc_url)
    
    #2 pull information from BBC for posts database 
    bbc_image = bbc_doc.css('div.responsive-image.responsive-image--16by9 img')[0]['src']
    bbc_image = bbc+ bbc_image unless bbc_image.include? "http://"
    bbc_headline = bbc_doc.css('h3.hard-news-unit__headline a')[0].text.strip
    bbc_description = bbc_doc.css('p.hard-news-unit__summary')[0].text
    bbc_source = bbc_doc.css('div.orb-nav-section.orb-nav-blocks a img')[0]['src']
    bbc_link = bbc_doc.css('h3.hard-news-unit__headline a')[0]['href']
    bbc_link = bbc + bbc_link unless bbc_link.include? "http://"

    #3 Add data to posts database
    if Post.find_by(headline: bbc_headline).nil?
      @post = Post.new
      @post.image = bbc_image
      @post.headline = bbc_headline
      @post.description = bbc_description
      @post.source = bbc_source
      @post.source_url = bbc_link
      #4 Save data in posts table
      @post.save
    end # end if statement
    #*************************************************************************************************
    # CNNarabic
    #
    #1 Fetch the website data
    cnn = "http://arabic.cnn.com"
    cnn_url = open("http://arabic.cnn.com/")
    cnn_doc = Nokogiri::HTML(cnn_url)

    #2 pull information from CNN Arabic for posts database 
    cnn_image = cnn_doc.css('div.news-content.breakpoint a img')[0]['src']
    cnn_image = cnn + cnn_image unless cnn_image.include? "http://"
    cnn_headline = cnn_doc.css("div.news-content.breakpoint a img")[0]['alt']
    cnn_description = cnn_doc.css("div.news-content.breakpoint a img")[0]['alt']
    cnn_source = "cnn-large.gif"
    cnn_link = cnn_doc.css('div.news-content.breakpoint a')[0]['href']
    cnn_link = cnn + cnn_link unless cnn_link.include? "http://"
    
    #3 Add data to posts database
    if Post.find_by(headline: cnn_headline).nil?
      @post = Post.new
      @post.image = cnn_image
      @post.headline = cnn_headline
      @post.description = cnn_description
      @post.source = cnn_source
      @post.source_url = cnn_link
      #4 Save data in posts table
      @post.save
    end # end if statement
    #*************************************************************************************************
    # CNNarabic
    #
    #1 Fetch the website data
    abusiness = "http://arabic.arabianbusiness.com"
    abusiness_url = open("http://arabic.arabianbusiness.com/business/")
    abusiness_doc = Nokogiri::HTML(abusiness_url)
    
    #2 pull information from CNN Arabic for posts database
    abusiness_image = abusiness_doc.css('div.col-md-6.col-sm-6.col-xs-6.pull-right.top-story-section a img')[0]['src']
    abusiness_image = abusiness + abusiness_image unless abusiness_image.include? "http://"
    abusiness_headline = abusiness_doc.css('h1.title-one a').text
    abusiness_description = abusiness_doc.css('div.story-intro').text
    #abusiness_source = abusiness_doc.css('img[alt="Arabian business"]')[1]['src']
    #abusiness_source = abusiness + abusiness_source unless abusiness_source.include? "http://"
    abusiness_link = abusiness_doc.css('div.col-md-6.col-sm-6.col-xs-6.pull-right.top-story-section a')[0]['href']
    abusiness_link = abusiness + abusiness_link unless abusiness_link.include? "http://"
    
    #3 Add data to posts database
    if Post.find_by(headline: abusiness_headline).nil?
      @post = Post.new
      @post.image = abusiness_image
      @post.headline = abusiness_headline
      @post.description = abusiness_description
      @post.source = "arabianbusiness.jpg"
      @post.source_url = abusiness_link
      #4 Save data in posts table
      @post.save
    end # end if statement
    #*************************************************************************************************
=begin    # aawsat.com
    #
    #1 Fetch the website data
    aawsat = "http://www.aawsat.com"
    aawsat_url = open("http://www.aawsat.com/home/international/section/arab-world")
    aawsat_doc = Nokogiri::HTML(aawsat_url)
    
    #2 pull information from CNN Arabic for posts database
    aawsat_image = aawsat_doc.css('img[typeof="foaf:Image"]')[0]['src']
    aawsat_image = aawsat_image + aawsat_image unless aawsat_image.include? "http://"
    aawsat_headline = aawsat_doc.css('span.field-content a')[0].text
    aawsat_description = aawsat_doc.css('div.field-content p')[0].text
    aawsat_link = aawsat_doc.css('span.field-content a')[0]['href']
    aawsat_link = aawsat + aawsat_link unless aawsat_link.include? "http://"
    
    #3 Add data to posts database
    if Post.find_by(headline: aawsat_headline).nil?
      @post = Post.new
      @post.image = aawsat_image
      @post.headline = aawsat_headline
      @post.description = aawsat_description
      @post.source = "aawsat.png"
      @post.source_url = aawsat_link
      #4 Save data in posts table
      @post.save
    end
=end
    #*************************************************************************************************
    # aawsat.com
    #
    #1 Fetch the website data
    cnbc = "http://www.cnbcarabia.com"
    cnbc_url = open("http://www.cnbcarabia.com/")
    cnbc_doc = Nokogiri::HTML(cnbc_url)
    
    #2 pull information from CNN Arabic for posts database
    cnbc_image = cnbc_doc.css('div.latest_image_prev img')[0]['src']
    cnbc_image = cnbc + cnbc_image unless cnbc_image.include? "http://"
    cnbc_headline = cnbc_doc.css('h3.heading1 a')[0].text.strip
    cnbc_description = cnbc_doc.css("div.content-excerpt")[2].text
    cnbc_source = cnbc_doc.css('div#header a img')[0]['src']
    cnbc_source = cnbc + cnbc_source unless cnbc_source.include? "http://"
    cnbc_link = cnbc_doc.css('h3.heading1 a')[0]['href']
    cnbc_link = cnbc + cnbc_link unless cnbc_link.include? "http://"
    
    #3 Add data to posts database
    if Post.find_by(headline: cnbc_headline).nil?
      @post = Post.new
      @post.image = cnbc_image
      @post.headline = cnbc_headline
      @post.description = cnbc_description
      @post.source = cnbc_source
      @post.source_url = cnbc_link
      #4 Save data in posts table
      @post.save
    end  
  end # end scrape task
  ####################################################################################################
                 #############################   ******   ###############################
  ####################################################################################################
  # Second Task!
  desc "Destroy all posts"
  task destroy_all_posts: :environment do
    Post.destroy_all
  end # end destroy_all_posts task
  
  ####################################################################################################
                 #############################   ******   ###############################
  ####################################################################################################
  # Third Task!
  desc "Discard old posts"
  task discard: :environment do 
    Post.all.each do |post| 
      if post.created_at < 23.hours.ago
        post.destroy
      end
    end
  end # end discard task
end