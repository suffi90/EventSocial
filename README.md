<img src="https://raw.githubusercontent.com/rdt712/EventSocial/master/app/assets/images/Event-Social-Brand.png" alt="Drawing" style="width: 550px;"/>

Authors

	Backend:  Ryan Toler
	Frontend: Joey Drees

[Event Social Live Demo][website]

[website]: https://eventsocial.herokuapp.com

#### Events made social, powered by Twitter.
Social media is now one of the most important tools planners and marketers can use to disseminate information about events and meetings, interact with attendees, solicit feedback, and create year-round engagement with a target audience. Why not combine event planning and social media?

## Dependencies

#### Install Ruby
First, make sure you have ruby installed.

**On a Mac**, open `/Applications/Utilities/Terminal.app` and type:

    ruby -v

If the output looks something like this, you're in good shape:

    ruby 2.3.0p0 (2015-12-25 revision 53290) [x86_64-darwin15]

If the output looks more like this, you need to [install Ruby][ruby]:
[ruby]: https://www.ruby-lang.org/en/downloads/

    ruby: command not found

**On Linux**, for Debian-based systems, open a terminal and type:

    sudo apt-get install ruby-dev

or for Red Hat-based distros like Fedora and CentOS, type:

    sudo yum install ruby-devel

(if necessary, adapt for your package manager)

**On Windows**, you can install Ruby with [RubyInstaller][].
[rubyinstaller]: http://rubyinstaller.org/downloads/

#### Install Rails
Next, you will need to install Rails.

Here is a guide to install [Rails][rails].
[rails]: http://installrails.com/steps/choose_os

#### Install ImageMagick via Homebrew
If you don't have Homebrew, you can get that [here][brew].
[brew]: http://brew.sh
	brew install ImageMagick

#### Event Social's Ruby and Rails version
	ruby 2.3.0p0 (2015-12-25 revision 53290) [x86_64-darwin15]

	rails 4.2.5.1

## Download and Set Up
<br />
Download the [zip file][zip] from GitHub and unzip the zip file to a directory of your choice.
[zip]: https://github.com/rdt712/EventSocial/archive/master.zip
For example, /workspace/EventSocial.

#### Bundle Install
	cd /workspace/EventSocial
	bundle install

#### Migrate the Database
	rake db:migrate 

#### Integrate the Twitter API
First, you must create a [Twitter App][app] to use the Twitter API.

Then, in /config/environments/development.rb, add your API keys from the Twitter App.

    $twitter = Twitter::REST::Client.new do |config|
    	config.consumer_key = "DEV_TWITTER_CONSUMER_KEY"
    	config.consumer_secret = "DEV_TWITTER_CONSUMER_SECRET"
    	config.access_token = "DEV_TWITTER_ACCESS_TOKEN"
    	config.access_token_secret = "DEV_TWITTER_ACCESS_TOKEN_SECRET"
	end

[app]: https://apps.twitter.com/

#### Start the Server
	rails server
