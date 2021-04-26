# frozen_string_literal: true

require File.expand_path('lib/validates_cnpj/version', __dir__)

Gem::Specification.new do |gem|
  gem.name        = 'validates_cnpj'
  gem.version     = ValidatesCnpj::VERSION
  gem.authors     = 'Paulo Henrique Lopes Ribeiro'
  gem.email       = 'plribeiro3000@gmail.com'
  gem.summary     = 'Validates CNPJ and test it with matchers in a simple way.'

  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features,examples,gemfiles}/*`.split("\n")
  gem.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  gem.require_paths = %w[lib]

  gem.required_ruby_version = '>= 2.2'

  gem.license = 'MIT'

  gem.add_development_dependency 'coveralls'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'rubocop', '< 0.68'
  gem.add_development_dependency 'rubocop-rspec'
  gem.add_development_dependency 'shoulda-matchers'

  gem.add_runtime_dependency 'activemodel'
end
