# Parameterize

[![CircleCI](https://circleci.com/gh/PavelTyk/ex_parameterize/tree/master.svg?style=shield)](https://circleci.com/gh/PavelTyk/ex_parameterize/tree/master)
[![Hex.pm](https://img.shields.io/librariesio/release/hex/ex_parameterize/1.0.0.svg)](https://hex.pm/packages/ex_parameterize)
[![Hex.pm](https://img.shields.io/hexpm/v/ex_parameterize.svg)](https://hex.pm/packages/ex_parameterize)

Replaces special characters in a string so that it may be used as part of a ‘pretty’ URL.
Supports any language.

## Installation

Add `ex_parameterize` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:ex_parameterize, "~> 1.0"}]
end
```

Update your dependencies:

```
$ mix deps.get
```

## Usage examples:

```elixir
Parameterize.parameterize("Привет, Мир!")
"privet-mir"

Parameterize.parameterize("Hello, World!")
"hello-world"

Parameterize.parameterize("ሰላም ልዑል")
"salaame-leule"

Parameterize.parameterize("🍕")
nil
```

## Links

* [Documentation][1]
* [Hex][2]

## License

Parameterize is released under [MIT][3] license.

## Credits

* Inspired by [Slugify][4] and [Transliteration][5]

* Data ported from andyhu's excellent [Transliteration][5] package.

[1]: https://hexdocs.pm/ex_parameterize/Parameterize.html

[2]: https://hex.pm/packages/ex_parameterize

[3]: https://github.com/paveltyk/ex_parameterize/blob/master/LICENSE.md

[4]: https://github.com/jayjun/slugify

[5]: https://github.com/andyhu/transliteration
