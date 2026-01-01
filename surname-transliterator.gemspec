# frozen_string_literal: true

require_relative 'lib/surname/transliterator/version'

Gem::Specification.new do |spec|
  spec.name = 'surname-transliterator'
  spec.version = Surname::Transliterator::VERSION
  spec.authors = ['Justyna Wojtczak']
  spec.email = ['justine84@gmail.com']
  spec.license = 'MIT'

  spec.summary = 'Transliterate surnames between Polish and Lithuanian based on genealogical rules.'
  spec.description = 'A Ruby gem for transliterating surnames from Polish to Lithuanian and basic de-polonization, useful for genealogical research.'
  spec.homepage = 'https://github.com/justine84/surname-transliterator'
  spec.required_ruby_version = '>= 3.1.0'

  spec.metadata = {
    'source_code_uri' => 'https://github.com/justine84/surname-transliterator/tree/main',
    'homepage_uri' => spec.homepage,
    'changelog_uri' => 'https://github.com/justi-blue/surname-transliterator/blob/main/CHANGELOG.md',
    'rubygems_mfa_required' => 'true'
  }

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile]) ||
        f.end_with?('.gem')
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
