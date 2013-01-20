# HelloBar

Announcement plugin to include 'hello bar' into your app, for Ruby on Rails. Based on paul_revere.

![](https://dl.dropbox.com/u/555540/hello_bar.png)

You can show it a specific time, inform users about news on the web and measure all clicks.

Install with the asset pipeline (Rails 3.1+, asset pipeline enabled)
--------------------------------------------------------------------

Add this line to your application's Gemfile:

```ruby
gem 'hello_bar'
```

Execute:

```sh
$ bundle
```

Run the generator to create the migration and routes:

```sh
rails generate hello_bar
```

Add the default announcement CSS to `app/assets/stylesheets/application.css`:

```ruby
//= require announcements
```

Add the helper to `app/views/layouts/application.html.erb`:

```ruby
<%= hello_bar %>
```

Run the migration:

```sh
rake db:migrate
```

## Usage

HelloBar provides...

* A model called `Announcement`, which has columns:
    * message (text column)
    * link (string columns, mandtory) 
    * starts_at and ends_at (datetime columns, mandatory)
    You can use method "current" announcement.

* A helper called `#hello_bar`, which will return current announcement.
* Tracking into Google Analytics event

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request