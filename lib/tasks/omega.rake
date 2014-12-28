# MO. H. enterpreneur, Co-Founder & CEO at oxygenarabi.com

namespace :omega do
 require 'open-uri'
 require 'nokogiri'

    # First Task!
    desc "Destroy all posts"
    task destroy_all_posts: :environment do
      Post.destroy_all
    end # end destroy_all_posts task
  
    ####################################################################################################
                   #############################   ******   ###############################
    ####################################################################################################
    # Second Task!
    desc "Discard old posts"
    task discard: :environment do 
      Post.all.each do |post| 
        if post.created_at < 36.hours.ago
          post.destroy
        end
      end
    end # end discard task
  end