require "test_helper"

module Standard::Sorbet
  class PluginTest < Minitest::Test
    def setup
      @subject = Plugin.new({})
    end

    def test_paths
      assert_match "base.yml", @subject.rules(LintRoller::Context.new(target_ruby_version: RUBY_VERSION)).value.to_s
    end
  end
end
