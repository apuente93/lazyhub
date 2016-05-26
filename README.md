# Lazy Hub - an entertainment system for the web

Welcome to Lazy Hub, the entertainment system for the web. We provide you with all of the entertainment that you need, for free! Think of us as your entertainment hub, where you can read, game or socialize whenever YOU want! Whether you just want to laugh a little, get some updates on world news, or just play some games, we have everything you would want. Meet some friends, by commenting on posts and creating your own posts. Feel free to share your knowledge and have some fun!

## Requirements
Follow this tutorial http://railsapps.github.io/installrubyonrails-mac.html until you have downloaded all the requirements

Xcode Command Line Tools
* Homebrew
* GPG
* RVM
* RVM Gemsets
* Ruby
* Rails
* Postgres

Install Postgres after completing the tutorial by typing:
```{r, engine='bash', count_lines}
brew install postgresql
# To have launchd start postgresql at login:
ln -sfv /usr/local/opt/postgresql/*plist ~/Library/LaunchAgents
# Then to load postgresql now:
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
```

## Running Locally

1. After installing all of the requirements with the aid of the tutorial, you can clone the project

2. Run:
```{r, engine='bash', count_lines}
bundle install
```

3. If you get an error with pg gem, try this:
```{r, engine='bash', count_lines}
bundle install pg
bundle update
```
4. Now create a local database, migrate it, and seed it with initial data:
```{r, engine='bash', count_lines}
rake db:create
rake db:migrate
rake db:seed
```

5. Now you should be able to run the app locally using:
```{r, engine='bash', count_lines}
rails s
```

## Copyright
Copyright 2016 © Lazy Hub - All rights reserved
by Alejandro Puente