lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'meme_generate/version'

Gem::Specification.new do |spec|
  spec.name          = 'meme_generate'
  spec.version       = MemeGenerate::VERSION
  spec.authors       = ['Maanav Shah']
  spec.email         = ['shah.maanav.07@gmail.com']

  spec.summary       = 'Meme Generator.'
  spec.description   = 'A meme generator using api on https://memegen.link.'
  spec.homepage      = 'https://memegen.link/'
  spec.license       = 'MIT'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'rest-client', '~> 1.7'
  spec.add_dependency 'unirest', '~> 1.0'
  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
