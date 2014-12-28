# MO. H. Entrepreneur, CEO & Co-Founder at oxygenarabi.com
#
# Gamma scraper runs everyday btw 10:00am - 1:59pm

namespace :gamma do
  
  require "open-uri"
  require "nokogiri"
  
  
  # 1st task, gamma1 everyday at 10:10am
  desc " Fetch data from gamma1 sources"
  task gamma1: :environment do 
    
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
    
    # tech, masrawy.com
    #
    #1 Petch the website data
    masrawy = "http://www.masrawy.com/"
    masrawy_url = open("http://www.masrawy.com/news/tech-electronics/section/383/")
    masrawy_doc = Nokogiri::HTML(masrawy_url)
    
    begin
      #2 Assign variables to the fetched data
      masrawy_image = masrawy_doc.css('ul#MainContent_CatListingCtrl_ulItemListing li a img')[0]['src']
      masrawy_image = masrawy + masrawy_image unless masrawy_image.include? "http://"
      masrawy_headline = masrawy_doc.css('ul#MainContent_CatListingCtrl_ulItemListing p a')[0].text.strip
      masrawy_desc = masrawy_headline
      masrawy_source = "http://www.masrawy.com/version2015/images/masrawyLogo.png"
      masrawy_link = masrawy_doc.css('ul#MainContent_CatListingCtrl_ulItemListing li a')[0]['href']
      masrawy_link = masrawy + masrawy_link unless masrawy_link.include? "http://" 
    
      #3 Add data to posts database
      if (Post.find_by(headline: masrawy_headline).nil?) && (Post.find_by(image: masrawy_image).nil?)
        @post = Post.new
        @post.category_id = 4
        @post.image = masrawy_image
        @post.headline = masrawy_headline
        @post.description = masrawy_desc
        @post.source = masrawy_source
        @post.source_url = masrawy_link
        #4 Save data in posts table
        @post.save
      end # if statement
    rescue
    end # rescue
    #*************************************************************************************************
    
    # Business, arabiabusiness.com
    #
    #1 Petch the website data
    abusiness = "http://arabic.arabianbusiness.com"
    abusiness_url = open("http://arabic.arabianbusiness.com/business/")
    abusiness_doc = Nokogiri::HTML(abusiness_url)
    
    begin
      #2 Assign variables to the fetched data
      abusiness_image = abusiness_doc.css('div.col-md-6.col-sm-6.col-xs-6.pull-right.top-story-section a img')[0]['src']
      abusiness_image = abusiness + abusiness_image unless abusiness_image.include? "http://"
      abusiness_headline = abusiness_doc.css('h1.title-one a').text
      abusiness_desc = abusiness_doc.css('div.story-intro').text
      abusiness_source = "arabianbusiness.jpg"
      abusiness_link = abusiness_doc.css('div.col-md-6.col-sm-6.col-xs-6.pull-right.top-story-section a')[0]['href']
      abusiness_link = abusiness + abusiness_link unless abusiness_link.include? "http://"
    
      #3 Add data to posts database
      if (Post.find_by(headline: abusiness_headline).nil?) && (Post.find_by(image: abusiness_image).nil?)
        @post = Post.new
        @post.category_id = 2
        @post.image = abusiness_image
        @post.headline = abusiness_headline
        @post.description = abusiness_desc
        @post.source = abusiness_source
        @post.source_url = abusiness_link
        #4 Save data in posts table
        @post.save
      end # if statement
    rescue
    end # rescue
    #*************************************************************************************************
    # Health, youm7.com
    #
    #1 Fetch the website data
    
    youm7_health = "http://www.youm7.com"
    youm7_health_url = open("http://www.youm7.com/%D8%B5%D8%AD%D8%A9%20%D9%88%D8%B7%D8%A8-245")
    youm7_health_doc = Nokogiri::HTML(youm7_health_url)
    
    begin
      #2 Assign variables to the fetched data
      youm7_health_image = youm7_health_doc.css('div.sectionTopImg a img')[0]['src']
      youm7_health_image = youm7_health + youm7_health_image unless youm7_health_image.include? "http://"
      youm7_health_headline = youm7_health_doc.css('div.sectionTopData h3 a')[0].text.strip
      youm7_health_desc = youm7_health_doc.css('div.sectionTopData p')[0].text.strip
      youm7_health_source = "youm7.jpeg"
      youm7_health_link = youm7_health_doc.css('div.sectionTopImg a')[0]['href']
      youm7_health_link = youm7_health + youm7_health_link unless youm7_health_link.include? "http://"
    
      #3 Add data to posts database
      if (Post.find_by(headline: youm7_health_headline).nil?) && (Post.find_by(image: youm7_health_image).nil?)
        @post = Post.new
        @post.category_id = 6
        @post.image = youm7_health_image
        @post.headline = youm7_health_headline
        @post.description = youm7_health_desc
        @post.source = youm7_health_source
        @post.source_url = youm7_health_link
        #4 Save data in posts table
        @post.save
      end # if statement
    rescue
    end # rescue
    
    #*************************************************************************************************
    # Science, arabic.rt.com/technology
    #
    #1 Fetch the website data
    rt = "http://arabic.rt.com"
    rt_url = open("http://arabic.rt.com/technology/")
    rt_doc = Nokogiri::HTML(rt_url)
    
    begin
      #2 Assign variables to the fetched data
      rt_image = rt_doc.css('li.column.item-1 a span img')[0]['src']
      rt_image = rt + rt_image unless rt_image.include? "http://"
      rt_headline = rt_doc.css('li.column.item-1 h3 a')[0].text
      rt_desc = rt_doc.css('li.column.item-1 div.summary a')[0].text.strip
      rt_source = "http://arabic.rt.com/static/img/logo_rt/ar-logo-static.png"
      rt_link = rt_doc.css('li.column.item-1 a')[0]['href']
      rt_link = rt + rt_link unless rt_link.include? "http://"
    
      #3 Add data to posts database
      if (Post.find_by(headline: rt_headline).nil?) && (Post.find_by(image: rt_image).nil?)
        @post = Post.new
        @post.category_id = 5
        @post.image = rt_image
        @post.headline = rt_headline
        @post.description = rt_desc
        @post.source = rt_source
        @post.source_url = rt_link
        #4 Save data in posts table
        @post.save
      end # if statement
    rescue
    end # rescue
    
    #*************************************************************************************************
    # collection, arabic.rt.com/photolines
    #
    #1 Fetch the website data
    rt_collection = "http://arabic.rt.com"
    rt_collection_url = open("http://arabic.rt.com/photolines/")
    rt_collection_doc = Nokogiri::HTML(rt_collection_url)
    
    #2 Assign variables to the fetched data
    rt_collection_image = rt_collection_doc.css('div.media a img')[0]['src']
    rt_collection_image = rt_collection + rt_collection_image unless rt_collection_image.include? "http://"
    rt_collection_headline = rt_collection_doc.css('div.text_in h2 a')[0].text
    rt_collection_desc = rt_collection_doc.css('div.text_in a')[1].text.strip
    rt_collection_source = "http://arabic.rt.com/static/img/logo_rt/ar-logo-static.png"
    rt_collection_link = rt_collection_doc.css('div.media a')[0]['href']
    rt_collection_link = rt_collection + rt_collection_link unless rt_collection_link.include? "http://"
    
    #3 Add data to posts database
    if (Post.find_by(headline: rt_collection_headline).nil?) && (Post.find_by(image: rt_collection_image).nil?)
      @post = Post.new
      @post.category_id = 1
      @post.image = rt_collection_image
      @post.headline = rt_collection_headline
      @post.description = rt_collection_desc
      @post.source = rt_collection_source
      @post.source_url = rt_collection_link
      #4 Save data in posts table
      @post.save
    end # if statement
  end # gamma1
  
  ####################################################################################################
  #***************************************************************************************************
  #************************************           GAMMA2                 *****************************
  #***************************************************************************************************
  ####################################################################################################
  
  # 2nd task, gamma2 everyday at 10:10am
  
  desc "Fetch data from gamma2 sources"
  task gamma2: :environment do
   
    # Politics, alsharq alawsat
    #
    #1 Fetch the website data
    aawsat = "http://www.aawsat.com"
    aawsat_url = open("http://www.aawsat.com/home/international/section/arab-world")
    aawsat_doc = Nokogiri::HTML(aawsat_url)
    
    begin
      #2 Assign variables to the fetched data
      #aawsat_image = aawsat_doc.css('img[typeof="foaf:Image"]')[0]['src']
      aawsat_image = aawsat_doc.css('div.views-field.views-field-field-new-photo div a img')[0]['src']
      aawsat_image = aawsat_image + aawsat_image unless aawsat_image.include? "http://"
      aawsat_headline = aawsat_doc.css('div.views-field.views-field-title span a')[0].text
      aawsat_desc = aawsat_doc.css('div.field-content p')[0].text
      aawsat_source = "aawsat.png"
      aawsat_link = aawsat_doc.css('div.views-field.views-field-field-new-photo div a')[0]['href']
      aawsat_link = aawsat + aawsat_link unless aawsat_link.include? "http://"
    
      #3 Add data to posts database
      if (Post.find_by(headline: aawsat_headline).nil?) && (Post.find_by(image: aawsat_image).nil?)
        @post = Post.new
        @post.category_id = 3
        @post.image = aawsat_image
        @post.headline = aawsat_headline
        @post.description = aawsat_desc
        @post.source = aawsat_source
        @post.source_url = aawsat_link
        #4 Save data in posts table
        @post.save
      end # if statement
    rescue
    end # rescue
    
    #*************************************************************************************************
    
    # tech, aljadeed.com
    #
    #1 Petch the website data
    aljadeed = "http://www.aljadeed.com"
    aljadeed_url =open("http://www.aljadeed.com/")
    aljadeed_doc = Nokogiri::HTML(aljadeed_url)
    
    begin
      #2 Assign variables to the fetched data
      aljadeed_image = aljadeed_doc.css('div.post-thumbnail a img')[0]['src']
      aljadeed_image = aljadeed + aljadeed_image unless aljadeed_image.include? "http://"
      aljadeed_headline = aljadeed_doc.css('h2.post-box-title a')[0].text
      aljadeed_desc = aljadeed_doc.css('div.entry p')[0].text
      aljadeed_source = "http://www.aljadeed.com/wp-content/uploads/2012/09/logo.jpg"
      aljadeed_link = aljadeed_doc.css('div.post-thumbnail a')[0]['href']
      aljadeed_link = aljadeed + aljadeed_link unless aljadeed_link.include? "http://"
      
      #3 Add data to posts database
      if (Post.find_by(headline: aljadeed_headline).nil?) && (Post.find_by(image: aljadeed_image).nil?)
        @post = Post.new
        @post.category_id = 4
        @post.image = aljadeed_image
        @post.headline = aljadeed_headline
        @post.description = aljadeed_desc
        @post.source = aljadeed_source
        @post.source_url = aljadeed_link
        #4 Save data in posts table
        @post.save
      end # if statement
    rescue
    end # rescue
  
    #*************************************************************************************************
    # business, CNBCarabic
    #
    #1 Fetch the website data
    cnbc = "http://www.cnbcarabia.com"
    cnbc_url = open("http://www.cnbcarabia.com/")
    cnbc_doc = Nokogiri::HTML(cnbc_url)
    
    begin
      #2 Assign variables to the fetched data
      cnbc_image = cnbc_doc.css('div.latest_image_prev img')[0]['src']
      cnbc_image = cnbc + cnbc_image unless cnbc_image.include? "http://"
      cnbc_headline = cnbc_doc.css('h3.heading1 a')[0].text.strip
      cnbc_desc = cnbc_doc.css("div.content-excerpt")[2].text
      cnbc_source = cnbc_doc.css('div#header a img')[0]['src']
      cnbc_source = cnbc + cnbc_source unless cnbc_source.include? "http://"
      cnbc_link = cnbc_doc.css('h3.heading1 a')[0]['href']
      cnbc_link = cnbc + cnbc_link unless cnbc_link.include? "http://"
    
      #3 Add data to posts database
      if (Post.find_by(headline: cnbc_headline).nil?) && (Post.find_by(image: cnbc_image).nil?)
        @post = Post.new
        @post.category_id = 2
        @post.image = cnbc_image
        @post.headline = cnbc_headline
        @post.description = cnbc_desc
        @post.source = cnbc_source
        @post.source_url = cnbc_link
        #4 Save data in posts table
        @post.save
      end # if statement
    rescue
    end # rescue
    
    #*************************************************************************************************
    # Health, arabnet5.com/ health section
    #
    #1 Fetch the website data
    arabnet5 = "http://www.arabnet5.com/"
    arabnet5_url = open("http://www.arabnet5.com/news.asp?c=3&cid=813")
    arabnet5_doc = Nokogiri::HTML(arabnet5_url)
    
    begin
      #2 Assign variables to the fetched data
      arabnet5_image = arabnet5_doc.css('li.NewsRow a img')[0]['src']
      arabnet5_image = arabnet5 + arabnet5_image unless arabnet5_image.include? "http://"
      arabnet5_headline = arabnet5_doc.css('li.NewsRow h2 a')[0].text
      arabnet5_desc = arabnet5_doc.css('p.DetailsStyle')[0].text
      arabnet5_source = "http://www.arabnet5.com/images/arabnet5_logo3.gif"
      arabnet5_link = arabnet5_doc.css('li.NewsRow a')[0]['href']
      arabnet5_link = arabnet5 + arabnet5_link unless arabnet5_link.include? "http://"
    
      #3 Add data to posts database
      if (Post.find_by(headline: arabnet5_headline).nil?) && (Post.find_by(image: arabnet5_image).nil?)
        @post = Post.new
        @post.category_id = 6
        @post.image = arabnet5_image
        @post.headline = arabnet5_headline
       @post.description = arabnet5_desc
        @post.source = arabnet5_source
        @post.source_url = arabnet5_link
        #4 Save data in posts table
        @post.save
      end # if statement
    rescue
    end # rescue
    
    #*************************************************************************************************

    # Science, srabnet5.com
    #
    #1 Fetch the website data
    arabnet5_science = "http://www.arabnet5.com/"
    arabnet5_science_url = open("http://www.arabnet5.com/news.asp?c=3&cid=810")
    arabnet5_science_doc = Nokogiri::HTML(arabnet5_science_url)
    
    begin
      #2 Assign variables to the fetched data
      arabnet5_science_image = arabnet5_science_doc.css('li.NewsRow a img')[0]['src']
      arabnet5_science_image = arabnet5_science + arabnet5_science_image unless arabnet5_science_image.include? "http://"
      arabnet5_science_headline = arabnet5_science_doc.css('li.NewsRow h2 a')[0].text
      arabnet5_science_desc = arabnet5_science_doc.css('li.NewsRow p.DetailsStyle')[0].text
      arabnet5_science_source = "http://www.arabnet5.com/images/arabnet5_logo3.gif"
      arabnet5_science_link = arabnet5_science_doc.css('li.NewsRow a')[0]['href']
      arabnet5_science_link = arabnet5_science + arabnet5_science_link unless arabnet5_science_link.include? "http://"
    
      #3 Add data to posts database
      if (Post.find_by(headline: arabnet5_science_headline).nil?) && (Post.find_by(image: arabnet5_science_image).nil?)
        @post = Post.new
        @post.category_id = 5
        @post.image = arabnet5_science_image
        @post.headline = arabnet5_science_headline
        @post.description = arabnet5_science_desc
        @post.source = arabnet5_science_source
        @post.source_url = arabnet5_science_link
        #4 Save data in posts table
        @post.save
      end # if statement  
    rescue
    end # rescue

    #*************************************************************************************************
    # collection, bayyraq.com
    #
    #1 Fetch the website data
    bayyraq = "http://bayyraq.com"
    bayyraq_url = open("http://bayyraq.com/")
    bayyraq_doc = Nokogiri::HTML(bayyraq_url)
    
    begin
      #2 Assign variables to the fetched data
      bayyraq_image = bayyraq_doc.css('div.thumb a img')[0]['data-lazy-src']
      bayyraq_image = bayyraq + bayyraq_image unless bayyraq_image.include? "http://"
      bayyraq_headline = bayyraq_doc.css('div.excerpt-wrap h3 a')[0].text
      bayyraq_desc = bayyraq_doc.css('div.excerpt-wrap p')[0].text
      bayyraq_source = "http://bayyraq.s3.amazonaws.com/resources/logo.svg"
      bayyraq_link = bayyraq_doc.css('div.excerpt-wrap h3 a')[0]['href']
      bayyraq_link = bayyraq + bayyraq_link unless bayyraq_link.include? "http://"
    
      #3 Add data to posts database
      if (Post.find_by(headline: bayyraq_headline).nil?) && (Post.find_by(image: bayyraq_image).nil?)
        @post = Post.new
        @post.category_id = 1
        @post.image = bayyraq_image
        @post.headline = bayyraq_headline
        @post.description = bayyraq_desc
        @post.source = bayyraq_source
        @post.source_url = bayyraq_link
        #4 Save data in posts table
        @post.save
      end # if statement
    rescue
    end # rescue   
  end # gamma2
  
  
  ####################################################################################################
  #***************************************************************************************************
  #************************************           GAMMA3                ******************************
  #***************************************************************************************************
  ####################################################################################################
  
  # 3rd task, gamma3, everyday at 10:20am
  desc "Fetch headlines from Gamma3 sources"
  task gamma3: :environment do

    # Politics, CNN Global
    #
    #1 Fetch the website data
    cnn = "http://arabic.cnn.com"
    cnn_url = open("http://arabic.cnn.com/world")
    cnn_doc = Nokogiri::HTML(cnn_url)
    
    begin
      #2 Assign variables to the fetched data
      cnn_image = cnn_doc.css('div.breakpoint a img')[0]['src']
      cnn_image = cnn + cnn_image unless cnn_image.include? "http://"
      cnn_headline = cnn_doc.css('div.news-details.clearfix h2 a')[6].text
      cnn_desc = cnn_headline
      cnn_source = "cnn.jpeg"
      cnn_link = cnn_doc.css('div.breakpoint a')[0]['href']
      cnn_link = cnn + cnn_link unless cnn_link.include? "http://"
    
      #3 Add data to posts database
      if (Post.find_by(headline: cnn_headline).nil?) && (Post.find_by(image: cnn_image).nil?)
        @post = Post.new
        @post.category_id = 3
        @post.image = cnn_image
        @post.headline = cnn_headline
        @post.description = cnn_desc
        @post.source = cnn_source
        @post.source_url = cnn_link
        #4 Save data in posts table
        @post.save
      end # if statement
    rescue
    end # rescue
    
    #*************************************************************************************************
    # Tech, unlimited-tech
    #
    #1 Fetch the website data    
    unlimit = "http://www.unlimit-tech.com/blog"
    unlimit_url =  open("http://www.unlimit-tech.com/blog/")
    unlimit_doc = Nokogiri::HTML(unlimit_url)
    
    begin
      #2 Assign variables to the fetched data
      unlimit_image = unlimit_doc.css('div.cb-mask a img')[14]['src']
      unlimit_image =unlimit + unlimit_image unless unlimit_image.include? "http://"
      unlimit_headline = unlimit_doc.css('h2.h4 a')[14].text
      unlimit_desc = unlimit_doc.css('div.entry-content p')[15].text
      unlimit_source = "unlimited.png"
      #unlimit_source = "http://www.unlimit-tech.com/blog/wp-content/themes/unlimit-tech-theme/library/images/logo@2x.png"
      unlimit_link = unlimit_doc.css('div.cb-mask a')[14]['href']
      unlimit_link =unlimit + unlimit_link unless unlimit_link.include? "http://" 
    
      #3 Add data to posts database
      if (Post.find_by(headline: unlimit_headline).nil?) && (Post.find_by(image: unlimit_image).nil?)
        @post = Post.new
        @post.category_id = 4
        @post.image = unlimit_image
        @post.headline = unlimit_headline
       @post.description = unlimit_desc
        @post.source = unlimit_source
        @post.source_url = unlimit_link
        #4 Save data in posts table
        @post.save
      end # if statement  
    rescue
    end # rescue
    
    #*************************************************************************************************
    # business, araabic.BBC.com/ business section
    #
    #1 Fetch the website data
    bbc_business = "http://www.bbc.co.uk"
    bbc_business_url = open('http://www.bbc.co.uk/arabic/business')
    bbc_business_doc = Nokogiri::HTML(bbc_business_url)
    
    begin
      # Assign variables to the fetched data
      bbc_business_image = bbc_business_doc.css('div.responsive-image.responsive-image--16by9 img')[0]['src']
      bbc_business_image = bbc_business + bbc_business_image unless bbc_business_image.include? "http://"
      bbc_business_headline = bbc_business_doc.css('h3.hard-news-unit__headline a')[0].text.strip
      bbc_business_desc = bbc_business_doc.css('p.hard-news-unit__summary')[0].text
      bbc_business_source = bbc_business_doc.css('div.orb-nav-section.orb-nav-blocks a img')[0]['src']
      bbc_business_link = bbc_business_doc.css('h3.hard-news-unit__headline a')[0]['href']
      bbc_business_link = bbc_business + bbc_business_link unless bbc_business_link.include? "http://"
    
      #3 Add data to posts database
      if (Post.find_by(headline: bbc_business_headline).nil?) && (Post.find_by(image: bbc_business_image).nil?)
        @post = Post.new
        @post.category_id = 2
        @post.image = bbc_business_image
        @post.headline = bbc_business_headline
       @post.description = bbc_business_desc
        @post.source = bbc_business_source
        @post.source_url = bbc_business_link
        #4 Save data in posts table
        @post.save
      end # if statement
    rescue
    end # rescue
    
    #*************************************************************************************************
    
    # Science, skynewsarabia
    #
    #1 Fetch the website data
    skynews = "http://www.skynewsarabia.com"
    skynews_url = open("http://www.skynewsarabia.com/web/technology")
    skynews_doc = Nokogiri::HTML(skynews_url)
    
    begin
      #2 Assign variables to the fetched data
      skynews_image = skynews_doc.css('li.first.fr a img')[0]['src']
      skynews_image = skynews + skynews_image unless skynews_image.include? "http://"
      skynews_headline = skynews_doc.css('li.first.fr h2 a')[0].text
      skynews_desc = skynews_doc.css('li.first.fr p')[0].text
      skynews_source = "http://asset1.skynewsarabia.com/web/asset/8.8/images/logo_tiny.png"
      skynews_link = skynews_doc.css('li.first.fr a')[0]['href']
      skynews_link = skynews + skynews_link unless skynews_link.include? "http://"
      
      #3 Add data to posts database
      if (Post.find_by(headline: skynews_headline).nil?) && (Post.find_by(image: skynews_image).nil?)
        @post = Post.new
        @post.category_id = 5
        @post.image = skynews_image
        @post.headline = skynews_headline
        @post.description = skynews_desc
        @post.source = skynews_source
        @post.source_url = skynews_link
        #4 Save data in posts table
        @post.save
      end # if statement
    rescue
    end # rescue
  end # gamma3  
  
  ####################################################################################################
  #***************************************************************************************************
  #************************************           GAMMA4                ******************************
  #***************************************************************************************************
  ####################################################################################################
  
  # 4th task, gamma4, everyday at 10:30am
  desc "Fetch headlines from Gamma4 sources"
  task gamma4: :environment do

    # Politics, BBC Arabic
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
    
    # Politics, dw.de
    #
    #1 Fetch the website data
    dw = "http://www.dw.de"
    dw_url = open("http://www.dw.de/%D8%A7%D9%84%D8%B1%D8%A6%D9%8A%D8%B3%D9%8A%D8%A9/s-9106")
    dw_doc = Nokogiri::HTML(dw_url)
    
    begin
      #2 Assign variables to the fetched data
      dw_image = dw_doc.css('div.newsWrapper div img')[0]['src']
      dw_image = dw + dw_image unless dw_image.include? "http://"
      dw_headline = dw_doc.css('div.news h2')[0].text.strip
      dw_desc = dw_doc.css('div.newsWrapper p')[0].text
      dw_source = "dw.png"
      dw_link = dw_doc.css('div.news a')[0]['href']
      dw_link = dw + dw_link unless dw_link.include? "http://"
    
      #3 Add data to posts database
      if (Post.find_by(headline: dw_headline).nil?) && (Post.find_by(image: dw_headline).nil?)
        @post = Post.new
        @post.category_id = 3
        @post.image = dw_image
        @post.headline = dw_headline
       @post.description = dw_desc
        @post.source = dw_source
        @post.source_url = dw_link
        #4 Save data in posts table
        @post.save
      end # if statement
    rescue
    end  # rescue
    
    #*************************************************************************************************
    # Tech, shakwmakw
    #
    #1 Fetch the website data 
    shakwmakw = "http://www.shakwmakw.com"
    shakwmakw_url = open("http://www.shakwmakw.com/category/%D8%B9%D8%A7%D9%84%D9%85-%D8%A7%D9%84%D8%AA%D9%82%D9%86%D9%8A%D8%A9/")
    shakwmakw_doc = Nokogiri::HTML( shakwmakw_url)
    
    begin
      #2 Assign variables to the fetched data
      shakwmakw_image = shakwmakw_doc.css('div.post-thumbnail a img')[0]['src']
      shakwmakw_image = shakwmakw + shakwmakw_image unless shakwmakw_image.include? "http://" 
      shakwmakw_headline = shakwmakw_doc.css('article.item-list.item_1 h2 a').text
      shakwmakw_desc = shakwmakw_doc.css('div.entry p')[0].text
      shakwmakw_source = "http://www.shakwmakw.com/wp-content/uploads/2013/06/ShakwmakwLogo2.png"
      shakwmakw_link = shakwmakw_doc.css('div.post-thumbnail a')[0]['href']
      shakwmakw_link = shakwmakw + shakwmakw_link unless shakwmakw_link.include? "http://"
    
      #3 Add data to posts database
      if (Post.find_by(headline: shakwmakw_headline).nil?) && (Post.find_by(image: shakwmakw_image).nil?)
        @post = Post.new
        @post.category_id = 4
        @post.image = shakwmakw_image
        @post.headline = shakwmakw_headline
       @post.description = shakwmakw_desc
        @post.source = shakwmakw_source
        @post.source_url = shakwmakw_link
        #4 Save data in posts table
        @post.save
      end # if statement
    rescue
    end # rescue
    
    #*************************************************************************************************
    
    # Business, euronews.com
    #
    #1 Fetch the website data  
    euronews = "http://arabic.euronews.com"
    euronews_url = open("http://arabic.euronews.com/business/")
    euronews_doc = Nokogiri::HTML(euronews_url)
    
    begin
      #2 Assign variables to the fetched data
      euronews_image = euronews_doc.css('a.imgLink.largeImg.leftFloat img')[0]['src']
      euronews_image = euronews + euronews_image unless euronews_image.include? "http://"
      euronews_headline = euronews_doc.css('a.imgLink.largeImg.leftFloat')[0]['title']
      euronews_desc = euronews_doc.css('div.topStoryProd.rightFloat p').text
      euronews_source = "http://arabic.euronews.com//media/logo_222.gif"
      #euronews_source = "euronews.png"
      euronews_link = euronews_doc.css('a.imgLink.largeImg.leftFloat')[0]['href']
      euronews_link = euronews + euronews_link unless euronews_link.include? "http://"
    
      #3 Add data to posts database
      if (Post.find_by(headline: euronews_headline).nil?) && (Post.find_by(image: euronews_image).nil?)
        @post = Post.new
        @post.category_id = 2
        @post.image = euronews_image
        @post.headline = euronews_headline
       @post.description = euronews_desc
        @post.source = euronews_source
        @post.source_url = euronews_link
        #4 Save data in posts table
        @post.save
      end # if statement
    rescue
    end # rescue
    
    #*************************************************************************************************
    
    # business, as.investing
    #
    #1 Fetch the website data
    investing = "http://sa.investing.com"
    investing_url = open("http://sa.investing.com/news/most-popular-news")
    investing_doc = Nokogiri::HTML(investing_url)
    
    begin
      #2 Assign variables to the fetched data
      investing_image = investing_doc.css('div.largeTitle article a img')[0]['src']
      investing_image = investing + investing_image unless investing_image.include? "http://"
      investing_headline = investing_doc.css('div.textDiv a')[0]['title']
      investing_desc = investing_doc.css('div.textDiv p')[0].text
      investing_source = "http://glocdn.investing.com/logos/investing-com-logo.png"
      investing_link = investing_doc.css('div.textDiv a')[0]['href']
      investing_link = investing + investing_link unless investing_link.include? "http://"
    
      #3 Add data to posts database
      if (Post.find_by(headline: investing_headline).nil?) && (Post.find_by(image: investing_image).nil?)
        @post = Post.new
        @post.category_id = 2
        @post.image = investing_image
        @post.headline = investing_headline
       @post.description = investing_desc
        @post.source = investing_source
        @post.source_url = investing_link
        #4 Save data in posts table
        @post.save
      end # if statement
    rescue
    end # rescue  
  end # gamma4
  
  ####################################################################################################
  #***************************************************************************************************
  #************************************           GAMMA5                ******************************
  #***************************************************************************************************
  ####################################################################################################
  
  # 5th task, gamma5, everyday at 10:40am
  desc "Fetch headlines from Gamma5 sources"
  task gamma5: :environment do

    # Politics, alborsanews
    #
    #1 Fetch the website data
    alborsanews = "http://www.alborsanews.com/"
    alborsanews_url = open("http://www.alborsanews.com/category/%D8%B3%D9%8A%D8%A7%D8%B3%D8%A9/%D8%A7%D8%AE%D8%A8%D8%A7%D8%B1-%D8%B9%D8%A7%D9%84%D9%85%D9%8A%D9%87/")
    alborsanews_doc = Nokogiri::HTML(alborsanews_url)
    
    begin
      #2 Assign variables to the fetched data
      alborsanews_image = alborsanews_doc.css('div.ui-tabs-panel a img')[0]['src']
      alborsanews_image = alborsanews + alborsanews_image unless alborsanews_image.include? "http://"
      albosranews_headline = alborsanews_doc.css('div.ui-tabs-panel h3 a')[0].text
      alborsanews_desc = alborsanews_doc.css('div.info p')[1].text
      alborsanews_source = "http://www.alborsanews.com/beta/wp-content/themes/alborsanews-staging-migaber/images/logo.png"
      alborsanews_link = alborsanews_doc.css('div.ui-tabs-panel a')[0]['href']
      alborsanews_link = alborsanews + alborsanews_link unless alborsanews_link.include? "http://"
    
      #3 Add data to posts database
      if (Post.find_by(headline: albosranews_headline).nil?) && (Post.find_by(image: alborsanews_image).nil?)
        @post = Post.new
        @post.category_id = 3
        @post.image = alborsanews_image
        @post.headline = albosranews_headline
       @post.description = alborsanews_desc
        @post.source = alborsanews_source
        @post.source_url = alborsanews_link
        #4 Save data in posts table
        @post.save
      end # if statement
    rescue
    end # rescue
    
    #*************************************************************************************************

    # Politics, france24
    #
    #1 Fetch the website data  
    france24 = "http://www.france24.com"
    france24_url = open("http://www.france24.com/ar/middle-east/")
    france24_doc = Nokogiri::HTML(france24_url)
    
    begin
      #2 Assign variables to the fetched data
      france24_image = france24_doc.css('div.news-featured p img')[0]['src']
      france24_image = france24 + france24_image unless france24_image.include? "http://"
      france24_headline = france24_doc.css('div.news-featured h2 a')[0].text
      france24_desc = france24_headline
      france24_source = "france24.jpeg"
      france24_link = france24_doc.css('div.news-featured div h2 a')[0]['href']
      france24_link = france24 + france24_link unless france24_link.include? "http://"
    
      #3 Add data to posts database
      if (Post.find_by(headline: france24_headline).nil?) && (Post.find_by(image: france24_image).nil?)
        @post = Post.new
        @post.category_id = 3
        @post.image = france24_image
        @post.headline = france24_headline
       @post.description = france24_desc
        @post.source = france24_source
        @post.source_url = france24_link
        #4 Save data in posts table
        @post.save
      end # if statement
    rescue
    end # rescue
    
    #*************************************************************************************************
    
    # Tech, digital-argaam
    #
    #1 Fetch the website data
    digital_argaam = "http://digital.argaam.com"
    digital_argaam_url = open("http://digital.argaam.com/")
    digital_argaam_doc = Nokogiri::HTML(digital_argaam_url)
    
    
    begin
      #2 Assign variables to the fetched data
      digital_argaam_image = digital_argaam_doc.css('div.MainNewsFourColumn-ListingContainer-row1 a img')[0]['src']
      digital_argaam_image = digital_argaam + digital_argaam_image unless digital_argaam_image.include? "http://"
      digital_argaam_headline = digital_argaam_doc.css('div.MainNewsFourColumn-ListingContainer-row1 h2 a').text
      digital_argaam_desc = digital_argaam_doc.css('div.MainNewsFourColumn-ListingContainer-row1 p').text
      digital_argaam_source = "digital.argaam.jpeg"
      digital_argaam_link = digital_argaam_doc.css('div.MainNewsFourColumn-ListingContainer-row1 a')[0]['href']
      digital_argaam_link = digital_argaam + digital_argaam_link unless digital_argaam_link.include? "http://"
    
      #3 Add data to posts database
      if (Post.find_by(headline: digital_argaam_headline).nil?) && (Post.find_by(image: digital_argaam_headline).nil?)
        @post = Post.new
        @post.category_id = 4
        @post.image = digital_argaam_image
        @post.headline = digital_argaam_headline
       @post.description = digital_argaam_desc
        @post.source = digital_argaam_source
        @post.source_url = digital_argaam_link
        #4 Save data in posts table
        @post.save
      end # if statement
    rescue
    end # rescue
    
    #*************************************************************************************************

    # Business, alarabalyawm
    #
    #1 Fetch the website data  
    alarabalyawm_business = "http://alarabalyawm.net"
    alarabalyawm_business_url = open("http://alarabalyawm.net/?cat=51")
    alarabalyawm_business_doc = Nokogiri::HTML(alarabalyawm_business_url)
    
    begin
      #2 Assign variables to the fetched data
      alarabalyawm_business_image = alarabalyawm_business_doc.css('div.post-thumb a img')[0]['src']
      alarabalyawm_business_image = alarabalyawm_business + alarabalyawm_business_image unless alarabalyawm_business_image.include? "http://"
      alarabalyawm_business_headline = alarabalyawm_business_doc.css('div.post-thumb a')[0]['title']
      alarabalyawm_business_desc = alarabalyawm_business_doc.css('div.teaser-body.clear.clearfix p')[0].text
      alarabalyawm_business_source = "http://alarabalyawm.net/wp-content/themes/alarabalyawm/logo.png"
      alarabalyawm_business_link = alarabalyawm_business_doc.css('div.post-thumb a')[0]['href']
      alarabalyawm_business_link = alarabalyawm_business + alarabalyawm_business_link unless alarabalyawm_business_link.include? "http://"
    
      #3 Add data to posts database
      if (Post.find_by(headline: alarabalyawm_business_headline).nil?) && (Post.find_by(image: alarabalyawm_business_image).nil?)
        @post = Post.new
        @post.category_id = 2
        @post.image = alarabalyawm_business_image
        @post.headline = alarabalyawm_business_headline
       @post.description = alarabalyawm_business_desc
        @post.source = alarabalyawm_business_source
        @post.source_url = alarabalyawm_business_link
        #4 Save data in posts table
        @post.save
      end # if statement
    rescue
    end # rescue
    
    #*************************************************************************************************
    # Business, wamdah
    #
    #1 Fetch the website data
    wamdah = "http://ar.wamda.com"
    wamdah_url = open("http://ar.wamda.com/")
    wamdah_doc = Nokogiri::HTML(wamdah_url)
    
    begin
      #2 Assign variables to the fetched data
      wamdah_image = wamdah_doc.css('div.main_item_pic a img')[0]['src']
      wamdah_image = wamdah + wamdah_image unless wamdah_image.include? "http://"
      wamdah_headline = wamdah_doc.css('div.main_item_desc.home_main_item_desc h1')[0].text.strip
      wamdah_desc = wamdah_doc.css('div.main_item_desc.home_main_item_desc h4')[0].text.strip
      wamdah_source = "wamdah.png"
      wamdah_link = wamdah_doc.css('div.main_item_pic a')[0]['href']
      wamdah_link = wamdah + wamdah_link unless wamdah_link.include? "http://"
    
      #3 Add data to posts database
      if (Post.find_by(headline: wamdah_headline).nil?) && (Post.find_by(image: wamdah_image).nil?)
        @post = Post.new
        @post.category_id = 2
        @post.image = wamdah_image
        @post.headline = wamdah_headline
       @post.description = wamdah_desc
        @post.source = wamdah_source
        @post.source_url = wamdah_link
        #4 Save data in posts table
        @post.save
      end # if statement 
    rescue
    end # rescue  
  end # gamma5
  
  ####################################################################################################
  #***************************************************************************************************
  #************************************           GAMMA6                ******************************
  #***************************************************************************************************
  ####################################################################################################
  
  # 6th task, gamma6, everyday at 10:50am
  desc "Fetch headlines from Gamma6 sources"
  task gamma6: :environment do

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
    
    # Politics, alquds
    #
    #1 Fetch the website data 
    alquds = "http://www.alquds.co.uk"
    alquds_url = open("http://www.alquds.co.uk/?cat=16")
    alquds_doc = Nokogiri::HTML(alquds_url)
    
    begin
    #2 Assign variables to the fetched data
      alquds_image = alquds_doc.css('div.entry-thumbnails img')[0]['src']
      alquds_image = alquds + alquds_image unless  alquds_image.include? "http://"
      alquds_headline = alquds_doc.css('h3.entry-title a')[0].text
      alquds_desc = alquds_doc.css('div[align="right"]')[0].text
      #alquds_source = "http://www.alquds.co.uk/wp-content/uploads/2014/05/alqudslogonew.jpg"
      alquds_source = "alquds.jpeg"
      alquds_link = alquds_doc.css('h3.entry-title a')[0]['href']
      alquds_link = alquds + alquds_link unless alquds_link.include? "http://"
    
      #3 Add data to posts database
      if (Post.find_by(headline: alquds_headline).nil?) && (Post.find_by(image: alquds_image).nil?)
        @post = Post.new
        @post.category_id = 3
        @post.image = alquds_image
        @post.headline = alquds_headline
       @post.description = alquds_desc
        @post.source = alquds_source
        @post.source_url = alquds_link
        #4 Save data in posts table
        @post.save
      end # if statement
    rescue
    end # rescue
    
    #*************************************************************************************************
    # Tech, youm7
    #
    #1 Fetch the website data
    youm7_tech = "http://www.youm7.com"
    youm7_tech_url = open("http://www.youm7.com/%D8%B9%D9%84%D9%88%D9%85%20%D9%88%20%D8%AA%D9%83%D9%86%D9%88%D9%84%D9%88%D8%AC%D9%8A%D8%A7-328")
    youm7_tech_doc = Nokogiri::HTML(youm7_tech_url)
    
    begin
      #2 Assign variables to the fetched data
      youm7_tech_image = youm7_tech_doc.css('div.sectionTopImg a img')[0]['src']
      youm7_tech + youm7_tech_image unless youm7_tech_image.include? "http://"
      youm7_tech_headline = youm7_tech_doc.css('div.sectionTopData a').text
      youm7_tech_desc = youm7_tech_doc.css('div.sectionTopData p').text.strip
      youm7_tech_source = "youm7.jpeg"
      youm7_tech_link = youm7_tech_doc.css('div.sectionTopImg a')[0]['href']
      youm7_tech_link = youm7_tech + youm7_tech_link unless youm7_tech_link.include? "http://"
    
      #3 Add data to posts database
      if (Post.find_by(headline: youm7_tech_headline).nil?) && (Post.find_by(image: youm7_tech_image).nil?)
        @post = Post.new
        @post.category_id = 4
        @post.image = youm7_tech_image
        @post.headline = youm7_tech_headline
        @post.description = youm7_tech_desc
        @post.source = youm7_tech_source
        @post.source_url = youm7_tech_link
        #4 Save data in posts table
        @post.save
      end # if statement
    rescue
    end # rescue
    
    #*************************************************************************************************

    # business, -elshaab
    #
    #1 Fetch the website data
    elshaab = "http://www.elshaab.org"
    elshaab_url = open("http://www.elshaab.org/category/%D8%A7%D9%82%D8%AA%D8%B5%D8%A7%D8%AF/%D8%A7%D9%82%D8%AA%D8%B5%D8%A7%D8%AF-%D8%A7%D9%84%D8%B9%D8%A7%D9%84%D9%85")
    elshaab_doc = Nokogiri::HTML(elshaab_url)
    
    begin
      #2 Assign variables to the fetched data
      elshaab_image = elshaab_doc.css('div.homeNews img')[0]['src']
      elshaab_image = elshaab + elshaab_image unless elshaab_image.include? "http://"
      elshaab_headline = elshaab_doc.css('h5.title a')[0].text
      elshaab_desc = elshaab_doc.css('div.homeNewTitle p')[0].text
      elshaab_source = "elshaab.jpeg"
      elshaab_link = elshaab_doc.css('h5.title a')[0]['href']
      elshaab_link = elshaab + elshaab_link unless elshaab_link.include? "http://"
    
      #3 Add data to posts database
      if (Post.find_by(headline: elshaab_headline).nil?) && (Post.find_by(image: elshaab_image).nil?)
        @post = Post.new
        @post.category_id = 2
        @post.image = elshaab_image
        @post.headline = elshaab_headline
       @post.description = elshaab_desc
        @post.source = elshaab_source
        @post.source_url = elshaab_link
        #4 Save data in posts table
        @post.save
      end # if statement
    rescue
    end # rescue
  end # gamma6
  
end # namespace gamma