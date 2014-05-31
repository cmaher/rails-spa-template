require 'pathname'
module JasmineRails::SpecHelper
  def javascript_spec_files
    spec_dir = File.join(Rails.root, 'spec', 'javascripts', 'spec')
    spec_files = Dir["#{spec_dir}/**/*Spec.js"]

    spec_base_path = Pathname.new(spec_dir)
    spec_files.map do |file|
      relative_path = Pathname.new(file).relative_path_from(spec_base_path)
      require_path = relative_path.sub('.js', '')
      "/assets/spec/#{require_path}"
    end
  end
end