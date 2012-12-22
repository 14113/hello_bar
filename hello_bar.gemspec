# -*- encoding: utf-8 -*-
require File.expand_path('../lib/hello_bar/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Adam Martinik"]
  gem.email         = ["a.martinik@gmail.com"]
  gem.description   = %q{}
  gem.summary       = %q{Announcement plugin to include 'hello bar' for Ruby on Rails. Based on paul_revere.}
  gem.homepage      = "https://github.com/14113/hello_bar"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "hello_bar"
  gem.require_paths = ["lib"]
  gem.version       = HelloBar::VERSION

  gem.add_dependency("rails", "~> 3.0")
  gem.add_dependency("date_validator")
  gem.add_development_dependency("rspec")
  gem.add_development_dependency("rspec-rails")
  gem.add_development_dependency("sqlite3")
  gem.add_development_dependency("debugger")
end
