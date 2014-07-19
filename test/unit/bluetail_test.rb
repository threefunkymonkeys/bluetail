require 'minitest/autorun'
require 'minitest/spec'
require 'mocha/mini_test'
require 'ostruct'

require_relative '../lib/bluetail'

describe 'Bluetail' do
  def setup
    @response = OpenStruct.new(
      :code => 200,
      :body => "Fake Response"
    )
  end

  it 'should post to Twitter API' do
    api_url = "https://api.twitter.com/1.1/statuses/update.json"
    oauth_settings = {
        :consumer_key => ENV["BLUETAIL_API_KEY"],
        :consumer_secret => ENV["BLUETAIL_API_SECRET"],
        :token => ENV["BLUETAIL_TOKEN"],
        :token_secret => ENV["BLUETAIL_TOKEN_SECRET"]}

    bird = Bluetail.new(oauth_settings)

    status = "Test status"

    SimpleOAuth::Header.expects(:new).with("POST", api_url, {status: status}, oauth_settings).returns({})

    Net::HTTP.any_instance.expects(:request).returns(@response)

    Logger.any_instance.expects(:info).with("Success").returns(true)
    
    bird.tweet(status)
  end

  it 'should reject long statuses' do
    status = "a" * 141

    bird = Bluetail.new({})

    assert_raises(RuntimeError) do
      bird.tweet(status)
    end
  end
end

