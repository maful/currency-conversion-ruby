# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "currency-conversion/version"

Gem::Specification.new do |spec|
  spec.name = "currency-conversion"
  spec.version = CurrencyConversion::VERSION
  spec.authors = ["maful"]
  spec.email = ["mafulprayoga@gmail.com"]

  spec.summary = "Ruby bindings for the currencyapi"
  spec.homepage = "https://github.com/maful/currency-conversion-ruby"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata = {
    "homepage_uri" => spec.homepage,
    "bug_tracker_uri" => "https://github.com/maful/currency-conversion-ruby/issues",
    "source_code_uri" => "https://github.com/maful/currency-conversion-ruby",
    "github_repo" => "https://github.com/maful/currency-conversion-ruby",
    "rubygems_mfa_required" => "true"
  }

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", "~> 2.6"
  spec.add_dependency "activesupport", "~> 7.0"
end
