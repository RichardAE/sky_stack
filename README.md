Sky Stack
=====
This was an MVP for a Q&A style app for the Sky Ruby Guild which I made in a few evenings in my spare time.

Ultimately Slack proved to be an easier platform for people to ask questions, and so it wasn't used in the long term, however it was a fun app to build and was used as a reference 'best practice' app during a RoR grad scheme as well.

Installation
----------
It is a standard rails app. Clone the repo, then run these commands:

```bash
bundle
```

```bash
rake db:migrate
```


Usage
---------
Then finally to run the server:

```bash
rails s
```

You can now visit http://localhost:3000 to see the site.

Tests
--------
To run tests it, use RSpec:

```bash
rspec
```

To run the Rspec features using capybara webkit (default driver), you will first need to install 'qt':

```bash
brew install qt
```
