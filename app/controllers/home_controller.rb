require 'instagram'
require 'twitter'

class HomeController < ApplicationController

  def view
    @tag = flash[:tags]
    @tag ||= "sf"
    @twitter_tag = "#" + @tag
    @twitter_tag ||= "#sf"
    @tag_recent_media = Instagram.tag_recent_media(@tag, :count => 20)
    @tag_recent_tweets = Twitter.search(@twitter_tag, :count => 10, :results_type => 'recent')
  end

  def get_tags
  end
  def get_instagram
    #probably will need to implement multiple tag retrieval in here?
    flash[:tags] = params[:tags]
    redirect_to :controller => 'home', :action => 'view'
  end

  def connect
    Instagram.configure do |config|
      config.client_id ="4e8e2d519ff84f758e3640c8ec39c936"
      config.client_secret = "c60cbcbcee4c4987a56e0de6874da41b"
    end

    Twitter.configure do |config|
      config.consumer_key ="GVeDSGHHiZy6HJXG914w"
      config.consumer_secret ="Si8Sq9N85kJ3TRgqeK002ByIojtO4taYFlLMhRKJ8Lc"
      config.oauth_token ="47147376-jREFqUOSCsB5BGnCddFYguZcn4fAXv0bLw68K4M4E"
      config.oauth_token_secret = "JevlkDzvkhEvTGqvJMbkmEESEZcNlMWbtglCBr2lpM"
    end
    redirect_to :controller => 'home', :action => 'view'
  end

  def get_tweets
  end
end
