# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "active_record_snapshot"
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["dannguyen"]
  s.date = "2013-08-12"
  s.description = "For data records that only need to be partially updated, this provides versioning for dirty attributes"
  s.email = "dansonguyen@gmail.com"
  s.extra_rdoc_files = [
    "LICENSE",
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".document",
    ".rspec",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "VERSION",
    "lib/active_record_snapshot.rb",
    "lib/active_record_snapshot/snapped.rb",
    "lib/active_record_snapshot/snapshot.rb",
    "spec/active_record_snapshot_spec.rb",
    "spec/functional/schema_creation_spec.rb",
    "spec/spec_helper.rb",
    "spec/spec_simple_models.rb",
    "spec/unit/snapped_spec.rb",
    "spec/unit/snapshot_spec.rb"
  ]
  s.homepage = "http://github.com/dannguyen/active_record_snapshot"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.5"
  s.summary = "A system for storing snapshots of ActiveRecord objects"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<hashie>, [">= 0"])
      s.add_runtime_dependency(%q<sqlite3>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.14.0"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.8.4"])
      s.add_development_dependency(%q<database_cleaner>, ["= 1.0.1"])
      s.add_development_dependency(%q<pry>, [">= 0"])
      s.add_development_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_development_dependency(%q<delorean>, [">= 0"])
      s.add_development_dependency(%q<activesupport>, [">= 3.2.14"])
      s.add_development_dependency(%q<activerecord>, [">= 3.2.14"])
      s.add_development_dependency(%q<protected_attributes>, [">= 0"])
    else
      s.add_dependency(%q<hashie>, [">= 0"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 2.14.0"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<jeweler>, ["~> 1.8.4"])
      s.add_dependency(%q<database_cleaner>, ["= 1.0.1"])
      s.add_dependency(%q<pry>, [">= 0"])
      s.add_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_dependency(%q<delorean>, [">= 0"])
      s.add_dependency(%q<activesupport>, [">= 3.2.14"])
      s.add_dependency(%q<activerecord>, [">= 3.2.14"])
      s.add_dependency(%q<protected_attributes>, [">= 0"])
    end
  else
    s.add_dependency(%q<hashie>, [">= 0"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 2.14.0"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<jeweler>, ["~> 1.8.4"])
    s.add_dependency(%q<database_cleaner>, ["= 1.0.1"])
    s.add_dependency(%q<pry>, [">= 0"])
    s.add_dependency(%q<rdoc>, ["~> 3.12"])
    s.add_dependency(%q<delorean>, [">= 0"])
    s.add_dependency(%q<activesupport>, [">= 3.2.14"])
    s.add_dependency(%q<activerecord>, [">= 3.2.14"])
    s.add_dependency(%q<protected_attributes>, [">= 0"])
  end
end
