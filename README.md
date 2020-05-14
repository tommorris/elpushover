# Elpushover

An Elixir library based on HTTPoison to send notifications through
[Pushover](https://pushover.net/).

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `elpushover` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:elpushover, "~> 0.1.0"}
  ]
end
```

## Configuration

To use, you need to set two environment variables: `PUSHOVER_API_KEY` and `PUSHOVER_USER_TOKEN`.

In a Mix-based application, you can set these in your `config/config.exs` file:

```
config :elpushover, api_key: System.get_env("PUSHOVER_API_KEY")
config :elpushover, user_token: System.get_env("PUSHOVER_USER_TOKEN")
```

You can override these values at run time.

<!--
Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/elpushover](https://hexdocs.pm/elpushover).
-->
