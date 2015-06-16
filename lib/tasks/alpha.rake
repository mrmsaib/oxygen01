# MO. H. Enterpreneur, Co-founder & CEO at OxygenArabi.com
#

# alpha scraper runs every day btw 2:00am - 5:59am GMT.

namespace :alpha do  
  require 'open-uri'
  require 'nokogiri'

  
  #1st Task, alpha1, everyday at 2:00am
  desc "Fetch headlines from Alpha1 resources"
  task alpha1: :environment do

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
    # business, arabianbusiness.com 
    #
    #1 Fetch the website data
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
    

    #*************************************************************************************************
    # collection, thqafawe3lom
    #
    #1 Fetch the website data
    thqafawe3lom = "http://www.thqafawe3lom.com"
    thqafawe3lom_url = open("http://www.thqafawe3lom.com/search/label/%D9%85%D9%86%D9%88%D8%B9%D8%A7%D8%AA")
    thqafawe3lom_doc = Nokogiri::HTML(thqafawe3lom_url)
    
    begin
      #2 Assign variables to the fetched data
      thqafawe3lom_image = thqafawe3lom_doc.css('div.post-body img')[0]['src']
      thqafawe3lom_image = thqafawe3lom + thqafawe3lom_image unless thqafawe3lom_image.include? "http://"
      thqafawe3lom_headline = thqafawe3lom_doc.css('div.post h2 a')[0].text.strip
      thqafawe3lom_desc = thqafawe3lom_doc.css('div.post-body div h4 span')[1].text
      thqafawe3lom_source = "thqafawe3lom.jpeg"
      thqafawe3lom_link = thqafawe3lom_doc.css('div.post h2 a')[0]['href']
      thqafawe3lom_link = thqafawe3lom + thqafawe3lom_link unless thqafawe3lom_link.include? "http://"
      
      #3 Add data to posts database
      if (Post.find_by(headline: thqafawe3lom_headline).nil?) && (Post.find_by(image: thqafawe3lom_image).nil?)
        @post = Post.new
        @post.category_id = 1
        @post.image = thqafawe3lom_image
        @post.headline = thqafawe3lom_headline
       @post.description = thqafawe3lom_desc
        @post.source = thqafawe3lom_source
        @post.source_url = thqafawe3lom_link
        #4 Save data in posts table
        @post.save
      end # if statement
    rescue
    end # rescue

  end # alpha1 task
  ####################################################################################################
  #***************************************************************************************************
  #************************************           ALPHA2                  ****************************
  #***************************************************************************************************
  ####################################################################################################
  
  # 2nd task, alpha2, everyday at 2:10am 
  desc "Fetch headlines from Alpha2 resources"
  task alpha2: :environment do

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
    # Tech, unlimited-tech
    #
    #1 Fetch the website data    
    unlimit = "http://www.unlimit-tech.com/blog"
    unlimit_url =  open("http://www.unlimit-tech.com/blog/")
    unlimit_doc = Nokogiri::HTML(unlimit_url)
    
    begin
      # Assign variables to the fetched data
      unlimit_image = unlimit_doc.css('div#main div.cb-mask a img')[0]['src']
      unlimit_image =unlimit + unlimit_image unless unlimit_image.include? "http://"
      unlimit_headline = unlimit_doc.css('div#main h2 a')[0].text
      unlimit_desc = unlimit_doc.css('div#main div.entry-content p')[1].text
      unlimit_source = "unlimited.png"
      #unlimit_source = "http://www.unlimit-tech.com/blog/wp-content/themes/unlimit-tech-theme/library/images/logo@2x.png"
      unlimit_link = unlimit_doc.css('div#main div.cb-mask a')[0]['href']
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
    # Business, BBC arabic/ business section
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
    end # end
    #*************************************************************************************************
    # Health, thqafawe3lom/ health section
    #
    #1 Fetch the website data
    thqafawe3lom_health = "http://www.thqafawe3lom.com"
    thqafawe3lom_health_url = open("http://www.thqafawe3lom.com/search/label/%D8%B5%D8%AD%D9%87%20%D9%88%D8%AC%D9%85%D8%A7%D9%84")
    thqafawe3lom_health_doc = Nokogiri::HTML(thqafawe3lom_health_url)
    
    begin
      # Assign variables to the fetched data
      thqafawe3lom_health_image = thqafawe3lom_health_doc.css('div.post img')[0]['src']
      thqafawe3lom_health_image = thqafawe3lom_health + thqafawe3lom_health_image unless thqafawe3lom_health_image.include? "http://"
      thqafawe3lom_health_headline = thqafawe3lom_health_doc.css('div.post h2 a')[0].text.strip
      thqafawe3lom_health_desc = thqafawe3lom_health_doc.css('div.post span b')[0].text
      thqafawe3lom_health_source = "thqafawe3lom.jpeg"
      thqafawe3lom_health_link = thqafawe3lom_health_doc.css('div.post h2 a')[0]['href']
      thqafawe3lom_health_link = thqafawe3lom_health + thqafawe3lom_health_link unless thqafawe3lom_health_link.include? "http://"
    
      if (Post.find_by(headline: thqafawe3lom_health_headline).nil?) && (Post.find_by(image: thqafawe3lom_health_image).nil?)
        @post = Post.new
        @post.category_id = 6
        @post.image = thqafawe3lom_health_image
        @post.headline = thqafawe3lom_health_headline
        @post.description = thqafawe3lom_health_desc
        @post.source = thqafawe3lom_health_source
        @post.source_url = thqafawe3lom_health_link
        #4 Save data in posts table
        @post.save
      end # if statement
    rescue
    end # rescue
    #*************************************************************************************************
    # Collection, thqafawe3lom/ collection section
    #
    #1 Fetch the website data  
    thqafawe3lom = "http://www.thqafawe3lom.com"
    thqafawe3lom_url = open("http://www.thqafawe3lom.com/search/label/%D9%85%D9%86%D9%88%D8%B9%D8%A7%D8%AA")
    thqafawe3lom_doc = Nokogiri::HTML(thqafawe3lom_url)
    
    begin
      #2 Assign variables to the fetched data
      thqafawe3lom_image = thqafawe3lom_doc.css('div.post-body img')[0]['src']
      thqafawe3lom_image = thqafawe3lom + thqafawe3lom_image unless thqafawe3lom_image.include? "http://"
      thqafawe3lom_headline = thqafawe3lom_doc.css('div.post h2 a')[0].text.strip
      thqafawe3lom_desc = thqafawe3lom_doc.css('div.post-body div h4 span')[1].text
      thqafawe3lom_source = "thqafawe3lom.jpeg"
      thqafawe3lom_link = thqafawe3lom_doc.css('div.post h2 a')[0]['href']
      thqafawe3lom_link = thqafawe3lom + thqafawe3lom_link unless thqafawe3lom_link.include? "http://"
      
      #3 Add data to posts database
      if (Post.find_by(headline: thqafawe3lom_headline).nil?) && (Post.find_by(image: thqafawe3lom_image).nil?)
        @post = Post.new
        @post.category_id = 1
        @post.image = thqafawe3lom_image
        @post.headline = thqafawe3lom_headline
       @post.description = thqafawe3lom_desc
        @post.source = thqafawe3lom_source
        @post.source_url = thqafawe3lom_link
        #4 Save data in posts table
        @post.save
      end # if statement
    rescue
    end # rescue
  end # alpha2 task 
  
  ####################################################################################################
  #***************************************************************************************************
  #************************************           ALPHA3                  ****************************
  #***************************************************************************************************
  ####################################################################################################
  
  # 3rd task, alpha3, everyday at 2:20am  
  desc "Fetch headlines from Alpha3 resources"
  task alpha3: :environment do

    # Politics, dw
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
      if (Post.find_by(headline: digital_argaam_headline).nil?) && (Post.find_by(image: digital_argaam_image).nil?)
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
    # business, -elshaab
    #
    #1 Fetch the website data
    elshaab = "http://www.elshaab.org"
    elshaab_url = open("http://www.elshaab.org/category/%D8%A7%D9%82%D8%AA%D8%B5%D8%A7%D8%AF/%D8%A7%D9%82%D8%AA%D8%B5%D8%A7%D8%AF-%D8%A7%D9%84%D8%B9%D8%A7%D9%84%D9%85")
    elshaab_doc = Nokogiri::HTML(elshaab_url)
    
    begin
      #2 Assign variables to the fetched data
      #elshaab_image = elshaab_doc.css('div.homeNews img')[0]['src']
      #elshaab_image = elshaab + elshaab_image unless elshaab_image.include? "http://"
      elshaab_image = "economy.jpg"
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
    #*************************************************************************************************
    # Health, -thaqafnafsak
    #
    #1 Fetch the website data
    thaqafnafsak_health = "http://www.thaqafnafsak.com"
    thaqafnafsak_health_url = open("http://www.thaqafnafsak.com/category/health")
    thaqafnafsak_health_doc = Nokogiri::HTML(thaqafnafsak_health_url)
    
    begin
      #2 Assign variables to the fetched data
      thaqafnafsak_health_image = thaqafnafsak_health_doc.css('div.loop-thumb a img')[0]['src']
      thaqafnafsak_health_image = thaqafnafsak_health + thaqafnafsak_health_image unless thaqafnafsak_health_image.include? "http://"
      thaqafnafsak_health_headline = thaqafnafsak_health_headline = thaqafnafsak_health_doc.css('h3.loop-title a')[0].text.strip
      thaqafnafsak_health_desc = thaqafnafsak_health_doc.css('div.mh-excerpt')[0].text.strip
      thaqafnafsak_health_source = "http://www.thaqafnafsak.com/wp-content/uploads/2015/02/cropped-cropped-th_logo.jpg"
      thaqafnafsak_health_link = thaqafnafsak_health_doc.css('h3.loop-title a')[0]['href']
      thaqafnafsak_health_link = thaqafnafsak_health + thaqafnafsak_health_link unless thaqafnafsak_health_link.include? "http://"
    
      #3 Add data to posts database
      if (Post.find_by(headline: thaqafnafsak_health_headline).nil?) && (Post.find_by(image: thaqafnafsak_health_image).nil?)
        @post = Post.new
        @post.category_id = 6
        @post.image = thaqafnafsak_health_image
        @post.headline = thaqafnafsak_health_headline
       @post.description = thaqafnafsak_health_desc
        @post.source = thaqafnafsak_health_source
        @post.source_url = thaqafnafsak_health_link
        #4 Save data in posts table
        @post.save
      end # if statement
    rescue
    end # rescue 
  end # alpha3 task
  
end # namespace