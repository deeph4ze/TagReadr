require 'instagram'
require 'twitter'
require 'json'

class HomeController < ApplicationController

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


  def view
    @tags = params[:tags]
    @tags ||= "sfgiants"
    @tagsArr = @tags.split(',')
    #@twitter_tag = "#" + @tag
    #@twitter_tag ||= @tag
    @content = get_tags_media(@tagsArr)
    #@tag_recent_instagrams = Instagram.tag_recent_media(@tag, :count => 20)
    #@tag_recent_tweets = Twitter.search(@twitter_tag, :count => 20, :results_type => 'recent')
  end

  private
  def get_tags_media(tags)
    content = []
    tags.each do |tag|
        begin
          instagram_response = Instagram.tag_recent_media(tag, count: 20)
          twitter_response = Twitter.search(("#"+tag), :count => 20, :results_type => 'recent')
          content.append({
          "instagrams" => instagram_response,
           "tweets" => twitter_response
          })
        rescue
          content.append({"tweets" => Twitter.search(("#"+tag), :count => 20, :results_type => 'recent')})
        end
    end
    #returns array of hashes {instagram/tweet: respective objects }
    return content
  end

  private
  def check_json(json)
    JSON.parse(json)
      return true
    rescue JSON::ParserError
      return false  
  end

end
