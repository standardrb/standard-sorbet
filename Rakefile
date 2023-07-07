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
  puts "-----> Running standardrb in example/"
  output = `cd example; bundle exec standardrb`
  if output.include?("type_check_me.rb:1:1: Sorbet/FalseSigil: Invalid Sorbet sigil `banana`.")
    puts "Standard violation detected in example/ app as expected"
  else
    fail "Expected linting violation not detected. Ensure `cd example; bundle exec standardrb' fails with a violation."
  end
end

task default: %i[test standard:fix lint_test]
