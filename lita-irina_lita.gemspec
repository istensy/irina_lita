Gem::Specification.new do |spec|
  spec.name          = "lita-irina_lita"
  spec.version       = "0.1.0"
  spec.authors       = ["istensy"]
  spec.email         = ["irina_stensky@cable.comcast.com"]
  spec.description   = "description"
  spec.summary       = spec.description
  spec.homepage      = "https://github.com/istensy/irina_lita"
  spec.license       = "Comcast"
  spec.metadata      = { "lita_plugin_type" => "handler" }

  spec.files         = `git ls-files`.split("\n")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["/Users/istens200/lita-irina_lita/lib"]

  spec.add_runtime_dependency "lita", ">= 4.0"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rack-test"
  spec.add_development_dependency "rspec"
end
