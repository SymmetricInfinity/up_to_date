# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = "up_to_date"
  gem.version       = "0.0.1"
  gem.authors       = ["Stefan Natchev", "Adam Duke"]
  gem.email         = ["stefan.natchev@gmail.com", "adam.v.duke@gmail.com"]
  gem.summary       = "A gem for keeping your gems up to date"
  gem.description   = "up_to_date contains a rake task that you can use to keep your gems up to date."
  gem.homepage      = "http://github.com/SymmetricInfinity/up_to_date"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.required_ruby_version = '>= 1.9'

  gem.add_development_dependency 'rake', '~> 10.0.3'
end
