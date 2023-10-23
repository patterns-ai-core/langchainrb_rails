# frozen_string_literal: true

require_relative "lib/langchainrb_rails/version"

Gem::Specification.new do |spec|
  spec.name = "langchainrb_rails"
  spec.version = LangchainrbRails::VERSION
  spec.authors = ["Andrei Bondarev"]
  spec.email = ["andrei.bondarev13@gmail.com"]

  spec.summary = "Rails wrapper for langchainrb gem"
  spec.description = "Rails wrapper for langchainrb gem"
  spec.homepage = "https://rubygems.org/gems/langchainrb_rails"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/andreibondarev/langchainrb_rails"
  spec.metadata["changelog_uri"] = "https://github.com/andreibondarev/langchainrb_rails/CHANGELOG.md"
  spec.metadata["documentation_uri"] = "https://rubydoc.info/gems/langchainrb_rails"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "langchainrb", "~> 0.6.19"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
