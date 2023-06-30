module Standard::Sorbet
  class Plugin < LintRoller::Plugin
    def initialize(config)
      @config = config
    end

    def about
      LintRoller::About.new(
        name: "standard-sorbet",
        version: VERSION,
        homepage: "https://github.com/standardrb/standard-sorbet",
        description: "Configuration for rubocop-sorbet's rules"
      )
    end

    def supported?(context)
      true
    end

    def rules(context)
      trick_rubocop_into_thinking_we_required_rubocop_sorbet!

      LintRoller::Rules.new(
        type: :path,
        config_format: :rubocop,
        value: Pathname.new(__dir__).join("../../../config/base.yml")
      )
    end

    private

    # This is not fantastic.
    #
    # When you `require "rubocop-sorbet"`, it will not only load the cops,
    # but it will also monkey-patch RuboCop's default_configuration, which is
    # something that can't be undone for the lifetime of the process.
    #
    # See: https://github.com/Shopify/rubocop-sorbet/blob/main/lib/rubocop/sorbet/inject.rb
    #
    # As an alternative, standard-sorbet loads the cops directly, and then
    # simply tells the RuboCop config loader that it's been loaded. This is
    # taking advantage of a private API of an `attr_reader` that probably wasn't
    # meant to be mutated externally, but it's better than the `Inject` monkey
    # patching that rubocop-sorbet does (and many other RuboCop plugins do)
    def trick_rubocop_into_thinking_we_required_rubocop_sorbet!
      require "rubocop"
      require "rubocop/cop/sorbet_cops"
      RuboCop::ConfigLoader.default_configuration.loaded_features.add("rubocop-sorbet")
    end
  end
end
