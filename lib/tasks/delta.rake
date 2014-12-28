# MO. H. Entrepreneur, Co-Founder & CEO at oxygenarabi.com
#
#
# Delta scraper runs everyday btw 02:00pm - 5:59pm

namespace :delta do
  
  require "open-uri"
  require "nokogiri"
  
  
  # 1st task, delta1 everyday at 02:00pm
  desc " Fetch data from delta1 sources"
  task delta1: :environment do 
    
    # Politics, youm7
    #
    #1 Fetch the website data
    youm7 = "http://www.youm7.com"
    youm7_url = open"http://www.youm7.com/%D8%B5%D8%AD%D8%A7%D9%81%D8%A9%20%D8%B9%D8%A7%D9%84%D9%85%D9%8A%D8%A9-99"
    youm7_doc = Nokogiri::HTML(youm7_url)
    
    begin
      #2 Assign variables to the fetched data
      youm7_image = youm7_doc.css('div.sectionTopImg a img')[0]['src']
      youm7_image = youm7 + youm7_image unless youm7_image.include? "http://"
      youm7_headline = youm7_doc.css('div.sectionTopData h3 a').text
      youm7_desc = youm7_doc.css('div.sectionTopData p').text.strip
      youm7_source = "youm7.jpeg"
      youm7_link = youm7_doc.css('div.sectionTopImg a')[0]['href']
      youm7_link = youm7 + youm7_link unless youm7_link.include? "http://"
    
      #3 Add data to posts database
      if (Post.find_by(headline: youm7_headline).nil?) && (Post.find_by(image: youm7_image).nil?)
        @post = Post.new
        @post.category_id = 3
        @post.image = youm7_image
        @post.headline = youm7_headline
        @post.description = youm7_desc
        @post.source = youm7_source
        @post.source_url = youm7_link
        #4 Save data in posts table
        @post.save
      end # if statement
    rescue
    end # rescue
    
    #*************************************************************************************************

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
   
    # collection, eyn3
    #
    #1 Fetch the website data
    eyn3 = "http://eyn3.com"
    eyn3_url = open("http://eyn3.com/?q=ar/%D8%A3%D9%82%D8%B3%D9%80%D9%80%D9%80%D8%A7%D9%85-%D8%A7%D9%84%D8%A3%D8%AE%D8%A8%D8%A7%D8%B1/%D8%A7%D9%84%D8%A8%D9%8A%D8%AA-%D8%A8%D9%8A%D8%AA%D9%83")
    eyn3_doc = Nokogiri::HTML(eyn3_url)
    
    begin
      #2 Assign variables to the fetched data
      eyn3_image = eyn3_doc.css('div.field-content a img')[14]['src']
      eyn3_image = eyn3 + eyn3_image unless eyn3_image.include? "http://"
      eyn3_headline = eyn3_doc.css('div.views-field.views-field-title span a')[31].text
      eyn3_desc = eyn3_doc.css('div.views-field.views-field-body span')[0].text
      eyn3_source = "http://eyn3.com/sites/default/files/nmasoft_logo.png"
      eyn3_link = eyn3_doc.css('div.field-content a')[14]['href']
      eyn3_link = eyn3 + eyn3_link unless eyn3_link.include? "http://"
    
      #3 Add data to posts database
      if (Post.find_by(headline: eyn3_headline).nil?) && (Post.find_by(image: eyn3_image).nil?)
        @post = Post.new
        @post.category_id = 1
        @post.image = eyn3_image
        @post.headline = eyn3_headline
        @post.description = eyn3_desc
        @post.source = eyn3_source
        @post.source_url = eyn3_link
        #4 Save data in posts table
        @post.save
      end # if statement
    rescue
    end # rescue
  end # delta1
  
  ####################################################################################################
  #***************************************************************************************************
  #************************************           DELTA2                 *****************************
  #***************************************************************************************************
  ####################################################################################################
  
  # 2nd task, delta2 everyday at 02:10pm
  
  desc "Fetch data from delta2 sources"
  task delta2: :environment do
   
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
    
    # business, alkhaleej
    #
    #1 Fetch the website data
    alkhaleej = "http://www.alkhaleej.ae"
    alkhaleej_url = open"http://www.alkhaleej.ae/economics/business"
    alkhaleej_doc = Nokogiri::HTML(alkhaleej_url)
    
    begin
      #2 Assign variables to the fetched data
      alkhaleej_image = alkhaleej_doc.css('div.MainNewsImage a img')[0]['src']
      alkhaleej_image = alkhaleej + alkhaleej_image unless alkhaleej_image.include? "http://"
      alkhaleej_headline = alkhaleej_doc.css('div.SelectedNewsTitle a').text.strip
      alkhaleej_desc = alkhaleej_doc.css('div.SelectedNewsSummaryText').text.strip
      alkhaleej_source = "http://www.alkhaleej.ae/Content/shared/images/EconmicLogo.png"
      alkhaleej_link = alkhaleej_doc.css('div.MainNewsImage a')[0]['href']
      alkhaleej_link = alkhaleej + alkhaleej_link unless alkhaleej_link.include? "http://"
    
      #3 Add data to posts database
      if (Post.find_by(headline: alkhaleej_headline).nil?) && (Post.find_by(image: alkhaleej_image).nil?)
        @post = Post.new
        @post.category_id = 2
        @post.image = alkhaleej_image
        @post.headline = alkhaleej_headline
       @post.description = alkhaleej_desc
        @post.source = alkhaleej_source
        @post.source_url = alkhaleej_link
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

    # collection, masrawy.com
    #
    #1 Petch the website data
    masrawy_islam = "http://www.masrawy.com"
    masrawy_islam_url = open("http://www.masrawy.com/Islameyat/makalat/section/50/%D9%85%D9%82%D8%A7%D9%84%D8%A7%D8%AA")
    masrawy_islam_doc = Nokogiri::HTML(masrawy_islam_url)
    
    begin
      #2 Assign variables to the fetched data
      masrawy_islam_image = masrawy_islam_doc.css('ul#MainContent_CatListingCtrl_ulItemListing li a img')[0]['src']
      masrawy_islam_image = masrawy_islam + masrawy_islam_image unless masrawy_islam_image.include? "http://"
      masrawy_islam_headline = masrawy_islam_doc.css('ul#MainContent_CatListingCtrl_ulItemListing li p')[0].text.strip
      masrawy_islam_desc = masrawy_islam_headline
      masrawy_islam_source = "http://www.masrawy.com/version2015/images/masrawyLogo.png"
      masrawy_islam_link = masrawy_islam_doc.css('ul#MainContent_CatListingCtrl_ulItemListing li a')[0]['href']
      masrawy_islam_link = masrawy_islam + masrawy_islam_link unless masrawy_islam_link.include? "http://"

      #3 Add data to posts database
      if (Post.find_by(headline: masrawy_islam_headline).nil?) && (Post.find_by(image: masrawy_islam_image).nil?)
        @post = Post.new
        @post.category_id = 1
        @post.image = masrawy_islam_image
        @post.headline = masrawy_islam_headline
        @post.description = masrawy_islam_desc
        @post.source = masrawy_islam_source
        @post.source_url = masrawy_islam_link
        #4 Save data in posts table
        @post.save
      end # if statement
    rescue
    end # rescue
    #*************************************************************************************************
    
    # collection, elaph.com
    #
    #1 Fetch the website data
    elaph = "http://www.elaph.com"
    elaph_url = open("http://www.elaph.com/lifestyle/travel.htm")
    elaph_doc = Nokogiri::HTML(elaph_url)
    
    begin
      #2 Assign variables to the fetched data
      elaph_image = elaph_doc.css('div.sub_featured div a img')[0]['src']
      elaph_image = elaph + elaph_image unless elaph_image.include? "http://"
      elaph_headline = elaph_doc.css('div.sub_featured h2')[0].text.strip
      elaph_desc = elaph_doc.css('div.summary')[0].text.strip
      elaph_source = "http://www.elaph.com/web/images2012/elaph_logo.png"
      elaph_link = elaph_doc.css('div.sub_featured div a')[0]['href']
      elaph_link = elaph + elaph_image unless elaph_link.include? "http://"
    
      #3 Add data to posts database
      if (Post.find_by(headline: elaph_headline).nil?) && (Post.find_by(image: elaph_image).nil?)
        @post = Post.new
        @post.category_id = 1
        @post.image = elaph_image
        @post.headline = elaph_headline
       @post.description = elaph_desc
        @post.source = elaph_source
        @post.source_url = elaph_link
        #4 Save data in posts table
        @post.save
      end # if statement
    rescue
    end # rescue 
  end # delta2
  
  ####################################################################################################
  #***************************************************************************************************
  #************************************           DELTA3                 *****************************
  #***************************************************************************************************
  ####################################################################################################
  
  # 3rd task, delta3 everyday at 02:20pm
  
  desc "Fetch data from delta3 sources"
  task delta3: :environment do
   
    # Politics, alsharq alawsat
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
    # Politics, Soutalomma
    #
    #1 Fetch the website data 
    soutalomma = "http://www.soutalomma.com"
    soutalomma_url = open("http://www.soutalomma.com/article/7")
    soutalomma_doc = Nokogiri::HTML(soutalomma_url)
    
    begin
      #2 Assign variables to the fetched data
      soutalomma_image = soutalomma_doc.css('div.field-item.even a img')[0]['src']
      soutalomma_image = soutalomma + soutalomma_image unless soutalomma_image.include? "http://"
      soutalomma_headline = soutalomma_doc.css('h2.node-title a')[0].text
      soutalomma_desc = soutalomma_doc.css(' div.field-item.even')[2].text
      soutalomma_source = "http://www.soutalomma.com/sites/all/themes/soutelomma/images/logo.jpg"
      soutalomma_link = soutalomma_doc.css('h2.node-title a')[0]['href']
      soutalomma_link = soutalomma + soutalomma_link unless soutalomma_link.include? "http://"
      #3 Add data to posts database
      if (Post.find_by(headline: soutalomma_headline).nil?) && (Post.find_by(image: soutalomma_image).nil?)
        @post = Post.new
        @post.category_id = 3
        @post.image = soutalomma_image
        @post.headline = soutalomma_headline
       @post.description = soutalomma_desc
        @post.source = soutalomma_source
        @post.source_url = soutalomma_link
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
    
    #*************************************************************************************************
    # collection, jo.arabiaweather
    #
    #1 Fetch the website data
    weather = "http://jo.arabiaweather.com"
    weather_url = open("http://jo.arabiaweather.com/%D8%A7%D9%84%D8%B7%D8%A8%D9%8A%D8%B9%D8%A9-%D9%85%D9%86-%D8%AD%D9%88%D9%84%D9%86%D8%A7")
    weather_doc = Nokogiri::HTML(weather_url)
    
    begin
      #2 Assign variables to the fetched data
      weather_image = weather_doc.css('div.views-field.views-field-field-image span a img')[0]['src']
      weather_image = weather + weather_image unless weather_image.include? "http://"
      weather_headline = weather_doc.css('div.views-field.views-field-title')[0].text
      weather_desc = weather_headline
      #weather_source = "http://d2a0do11gpvbrl.cloudfront.net/sites/all/themes/arabiaweather/logo.png"
      weather_source = "weather.jpeg"
      weather_link = weather_doc.css('div.views-field.views-field-field-image span a')[0]['href']
      weather_link = weather + weather_link unless weather_link.include? "http://"
    
      #3 Add data to posts database
      if (Post.find_by(headline: weather_headline).nil?) && (Post.find_by(image: weather_image).nil?)
        @post = Post.new
        @post.category_id = 1
        @post.image = weather_image
        @post.headline = weather_headline
       @post.description = weather_desc
        @post.source = weather_source
        @post.source_url = weather_link
        #4 Save data in posts table
        @post.save
      end # if statement
    rescue
    end # rescue  
  end # delta3

end # namespace
