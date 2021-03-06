lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "deploy_changes/version"

Gem::Specification.new do |spec|
  spec.name          = "deploy_changes"
  spec.version       = DeployChanges::VERSION
  spec.authors       = ["David Balatero"]
  spec.email         = ["dbalatero@gmail.com"]

  spec.summary       = %q{Lets you check if files/directories have changed in Git between last run}
  spec.homepage      = "https://github.com/dbalatero/deploy_changes"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rugged", "~> 0.26"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "pry", "~> 0.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
