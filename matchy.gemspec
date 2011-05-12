# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{matchy}
  s.version = "0.5.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jeremy McAnally"]
  s.date = %q{2011-05-12}
  s.description = %q{RSpec-esque matchers for use in Test::Unit}
  s.email = ["jeremy@entp.com"]
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    "License.txt",
    "README.rdoc",
    "Rakefile",
    "countloc.rb",
    "lib/matchy.rb",
    "lib/matchy/assertions.rb",
    "lib/matchy/built_in/change_expectations.rb",
    "lib/matchy/built_in/enumerable_expectations.rb",
    "lib/matchy/built_in/error_expectations.rb",
    "lib/matchy/built_in/operator_expectations.rb",
    "lib/matchy/built_in/truth_expectations.rb",
    "lib/matchy/custom_matcher.rb",
    "lib/matchy/expectation_builder.rb",
    "lib/matchy/matcher_builder.rb",
    "lib/matchy/modals.rb",
    "lib/matchy/version.rb"
  ]
  s.homepage = %q{http://matchy.rubyforge.org}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{RSpec-esque matchers for use in Test::Unit}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

