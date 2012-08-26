# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "validates_cnpj/version"

Gem::Specification.new do |s|
  s.name        = "validates_cnpj"
  s.version     = ValidatesCnpj::VERSION
  s.authors     = ["Paulo Henrique Lopes Ribeiro"]
  s.email       = %q{plribeiro3000@gmail.com}
  s.homepage    = ""
  s.summary     = %q{CNPJ Validation GEM}
  s.description = %q{Validates CNPJ and test it with matchers in a simple way.}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = %w(lib)

  s.add_dependency "activemodel", ">= 3.0.0"
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec", ">= 2.0.0"
  s.add_development_dependency "activerecord", ">= 3.0.0"
  s.add_development_dependency "shoulda-matchers", ">= 1.2.0"
  s.add_development_dependency "remarkable_activerecord", "= 4.0.0.alpha4"
  s.add_development_dependency "sqlite3"
end
