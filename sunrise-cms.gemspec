# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{sunrise-cms}
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Igor Galeta", "Pavlo Galeta"]
  s.date = %q{2011-05-22}
  s.description = %q{Sunrise is a Aimbulance CMS}
  s.email = %q{galeta.igor@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
    "README.rdoc"
  ]
  s.files = [
    "CHANGELOG.rdoc",
    "LICENSE",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "lib/sunrise-cms.rb"
  ]
  s.homepage = %q{https://github.com/galetahub/sunrise}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{Rails CMS}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<sunrise-core>, ["~> 0.1.2"])
      s.add_runtime_dependency(%q<sunrise-scaffold>, ["~> 0.1.2"])
    else
      s.add_dependency(%q<sunrise-core>, ["~> 0.1.2"])
      s.add_dependency(%q<sunrise-scaffold>, ["~> 0.1.2"])
    end
  else
    s.add_dependency(%q<sunrise-core>, ["~> 0.1.2"])
    s.add_dependency(%q<sunrise-scaffold>, ["~> 0.1.2"])
  end
end
