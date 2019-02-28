use Mix.Config

Path.wildcard("test/*mocks*/*")
|> Enum.each(&Code.require_file("../#{&1}", __DIR__))
