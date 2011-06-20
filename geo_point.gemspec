# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{geo_point}
  s.version = "0.2.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Kristian Mandrup}]
  s.date = %q{2011-06-20}
  s.description = %q{Allows for easy parsing of Strings, Hashes and Arrays into a GeoPoint with lat/long}
  s.email = %q{kmandrup@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.textile"
  ]
  s.files = [
    ".document",
    ".rspec",
    "Gemfile",
    "LICENSE.txt",
    "README.textile",
    "Rakefile",
    "VERSION",
    "geo_point.gemspec",
    "lib/geo_point.rb",
    "lib/geo_point/calc.rb",
    "lib/geo_point/class_methods.rb",
    "lib/geo_point/core_extension.rb",
    "lib/geo_point/shared.rb",
    "spec/geo_point/class_methods_spec.rb",
    "spec/geo_point/coord_mode_spec.rb",
    "spec/geo_point/initializer_spec.rb",
    "spec/geo_point/lat_lon_spec.rb",
    "spec/geo_point_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/kristianmandrup/geo_point}
  s.licenses = [%q{MIT}]
  s.require_paths = [%q{lib}]
  s.rubygems_version = %q{1.8.5}
  s.summary = %q{A GeoPoint encapsulates latitude, longitude and various geo calculations relative to itself}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<geo_calc>, ["~> 0.7.5"])
      s.add_runtime_dependency(%q<geo_units>, ["~> 0.2.1"])
      s.add_development_dependency(%q<rspec>, [">= 2.6.0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.6"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.6.2"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
    else
      s.add_dependency(%q<geo_calc>, ["~> 0.7.5"])
      s.add_dependency(%q<geo_units>, ["~> 0.2.1"])
      s.add_dependency(%q<rspec>, [">= 2.6.0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.6"])
      s.add_dependency(%q<jeweler>, ["~> 1.6.2"])
      s.add_dependency(%q<rcov>, [">= 0"])
    end
  else
    s.add_dependency(%q<geo_calc>, ["~> 0.7.5"])
    s.add_dependency(%q<geo_units>, ["~> 0.2.1"])
    s.add_dependency(%q<rspec>, [">= 2.6.0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.6"])
    s.add_dependency(%q<jeweler>, ["~> 1.6.2"])
    s.add_dependency(%q<rcov>, [">= 0"])
  end
end

