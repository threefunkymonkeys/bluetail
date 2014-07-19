# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "bluetail"
  s.version = "1.0"
  s.summary = "A Twitter notifier"
  s.license = "MIT"
  s.description = "A simple library to create tweets"
  s.authors = ["Lautaro Orazi", "Leonardo Mateo"]
  s.email = ["taro@threefunkymonkeys.com", "kandalf@threefunkymonkeys.com"]
  s.homepage = "https://github.com/threefunkymonkeys/bluetail"
  s.require_paths = ["lib"]
  s.add_dependency "simple_oauth", '~> 0.2'

  s.files = `git ls-files`.split("\n")
end
