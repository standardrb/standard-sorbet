require "test_helper"

module Standard::Sorbet
  class PluginTest < Minitest::Test
    def setup
      @subject = Plugin.new({})
    end

    def test_rules
      rules = @subject.rules(LintRoller::Context.new(target_ruby_version: RUBY_VERSION))

      assert_equal :object, rules.type
      assert_equal true, rules.value["Sorbet/AllowIncompatibleOverride"]["Enabled"]
    end
  end
end
