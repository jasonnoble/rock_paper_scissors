require 'rake'
require 'spec/rake/spectask'
# require 'metric_fu'

Spec::Rake::SpecTask.new(:spec) do |t|
  t.spec_files = FileList['spec/**/*spec.rb']
end

task :default  => :spec