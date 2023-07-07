require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/*_test.rb"]
end

require "standard/rake"

desc "Verify linting works in example project"
task :lint_test do
  Rake::Task["install"].execute
  output = `cd example; bundle exec standardrb`
  unless output.include?("type_check_me.rb:1:1: Sorbet/FalseSigil: Invalid Sorbet sigil `banana`.")
    fail "Expected linting violation not detected. Ensure that the example project properly detects Sorbet linting violations."
  end
end

task default: %i[test standard:fix lint_test]
