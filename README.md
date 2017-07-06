## Bluetail

Named after a kind of blue bird, [Bluetail](https://rubygems.org/gems/bluetail) is a small, easy to use Ruby library to make Twitter posts with your apps.

### Installation

```
gem install bluetail
```

### Pre-requisites

You'll need to define an application with write permissions in your twitter account to be able to use Bluetail. So, go to http://dev.twitter.com, sign in, create your application and make sure it has write permissions.

Then go to the `API Keys` tab for your Application Management page, and generate an access token for it.

You may have to wait a couple of seconds until Twitter makes your token visible and then you're ready to go.

From that page, you will need:

* API Key
* API Secret
* Access Token
* Access Token Secret

Copy them and make sure you have them accessible within your application (a config file, env vars, whatever you find more useful)

### Usage

You need to instantiate an object with the OAuth settings you copied before, and then you can just tweet:

```Ruby
require 'bluetail'

oauth_settings = {
    :consumer_key => ENV["BLUETAIL_API_KEY"],
    :consumer_secret => ENV["BLUETAIL_API_SECRET"],
    :token => ENV["BLUETAIL_TOKEN"],
    :token_secret => ENV["BLUETAIL_TOKEN_SECRET"]}

bird = Bluetail.new(oauth_settings)

bird.tweet("Look ma! I'm twitting")
```

Optionally, you can specify a log file in the constructor, if you don't do it, it will log to STDOUT by default.

```Ruby
bird = Bluetail.new(oauth_settings, "/var/log/my-tweets-log-file.log")
```

That's it, it's really simple to use.

Hope you enjoy it!
