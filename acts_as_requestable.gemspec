$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "acts_as_requestable/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "acts_as_requestable"
  s.version     = ActsAsRequestable::VERSION
  s.authors     = ["David Pallinder"]
  s.email       = ["davidpallinder@gmail.com"]
  s.homepage    = "http://www.github.com/Pallinder/acts_as_requestable"
  s.summary     = "Tiny gem to take care of approving/declining requests"
  s.description = ""
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 4.1.0"

  s.add_development_dependency "sqlite3"
end
