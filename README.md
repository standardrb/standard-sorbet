# standard-sorbet

This gem provides a [lint_roller](https://github.com/standardrb/lint_roller)
plugin configuration for the
[rubocop-sorbet](https://github.com/Shopify/rubocop-sorbet) ruleset to be run
as part of `standardrb` and `rake standard` in your project.

To install it, add it to your Gemfile:

```ruby
gem "standard-sorbet"
```

## Configuration

In your `.standard.yml` file in your project root, add `standard-sorbet` as a
plugin:

```yaml
plugins:
  - standard-sorbet
```

## Code of Conduct

This project follows Test Double's [code of
conduct](https://testdouble.com/code-of-conduct) for all community interactions,
including (but not limited to) one-on-one communications, public posts/comments,
code reviews, pull requests, and GitHub issues. If violations occur, Test Double
will take any action they deem appropriate for the infraction, up to and
including blocking a user from the organization's repositories.

