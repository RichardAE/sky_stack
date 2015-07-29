Sky Stack
=====
This is a work in progress of an internal Q&A app for the Sky Ruby Guild.

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
