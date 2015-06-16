# MO. H. enterpreneur, Co-Founder & CEO at oxygenarabi.com

namespace :omega do
 require 'open-uri'
 require 'nokogiri'
 
 # OMEGA1, destory old politics posts "where category_id: 3"
 # run this code every day
 #
 desc "Discard politics_old_posts"
 task omega1: :environment do 
   politics_posts = Post.where(category_id: 3)
   politics_posts.each do |post| 
     if post.created_at < 36.hours.ago
       post.destroy
     end # if
   end # do
 end # omega1
 
 #*************************************************************************************************
 # OMEGA2, destory old business + tech + science&knowledge  posts "where category_id: [2,4,5]"
 # run this code every 3 days
 #
 desc "discard business_tech_scienc_old_posts"
 task omega2: :environment do 
   business_tech_science_posts = Post.where(category_id: [2,4,5])
   business_tech_science_posts.each do |post|
     if post.created_at < 3.days.ago
       post.destroy
     end # if
   end # do
 end # omega2
 
 #*************************************************************************************************
 # OMEGA3, destory old collection + health  posts "where category_id: [1,6]"
 # run this code every 4 days
 #
 desc "discard collection_health_old_posts"
 task omega3: :environment do 
   collection_health_posts = Post.where(category_id: [1,6])
   collection_health_posts.each do |post|
     if post.created_at < 4.days.ago
       post.destroy
     end # if
   end # do
 end # omega3

 ####################################################################################################
                #############################   ******   ###############################
 ####################################################################################################
 
 # Destory Task!
    desc "Destroy all posts"
    task destroy_all_posts: :environment do
      Post.destroy_all
    end # end destroy_all_posts task
end # OMEGA