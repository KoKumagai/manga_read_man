# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'manga_read_man/version'

Gem::Specification.new do |spec|
  spec.name          = "manga_read_man"
  spec.version       = MangaReadMan::VERSION
  spec.authors       = ["Ko Kumagai"]
  spec.email         = ["ko.kumagai.ko@gmail.com"]

  spec.summary       = %q{Get image urls from mangareader(http://www.mangareader.net)}
  spec.description   = %q{Get image urls from mangareader(http://www.mangareader.net)}
  spec.homepage      = "https://github.com/KoKumagai/manga_read_man"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "nokogiri"
  spec.add_dependency "anemone"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
end
