require 'twitter'


#### Get your twitter keys & secrets:
#### https://dev.twitter.com/docs/auth/tokens-devtwittercom
twitter = Twitter::REST::Client.new do |config|
  config.consumer_key = 'x3ORE6R1ffiQudxyb9AahjdKP'
  config.consumer_secret = 'XSOBruMG4zuMW8kycu9eNOPP0L8sImJIKxxmPytfLBNp951TIu'
  config.oauth_token = '388097369-W81tTS4ConjKQ5di8UdVAsOX8fZ2GlXuFydNJHam'
  config.oauth_token_secret = 'Z7rKrDSbCdE3ufld6ARjT5sTP9H0XnOzOLqLVfgfaB73k'
end

search_term = URI::encode('#dev')

SCHEDULER.every '10m', :first_in => 0 do |job|
  begin
    tweets = twitter.search("#{search_term}")

    if tweets
      tweets = tweets.map do |tweet|
        { name: tweet.user.name, body: tweet.text, avatar: tweet.user.profile_image_url_https }
      end
      send_event('twitter_mentions', comments: tweets)
    end
  rescue Twitter::Error
    puts "\e[33mFor the twitter widget to work, you need to put in your twitter API keys in the jobs/twitter.rb file.\e[0m"
  end
end