class HomeController < ApplicationController
  def index
  	@tweet = Tweet.new
  end

  def create
  	@tweet = Tweet.new(tweet_params)
  	if @tweet.save
  	  flash[:success] = "Ca a tweeté ici :)"
  	  SendTweet.new("#{@tweet.content}").perform
  	  redirect_to root_path
  	else
  	  flash[:danger] = "No no no :("
  	  redirect_to root_path

  	end

  end


  private

  def tweet_params
 	params.require(:tweet).permit(:content)
  end

end
