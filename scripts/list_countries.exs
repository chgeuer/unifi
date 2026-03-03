#!/usr/bin/env elixir

Mix.install([{:unifi, path: Path.join(__DIR__, "..")}])

req = UniFi.Script.local_client()

UniFi.Script.header("Countries")
{:ok, %{status: 200, body: %{"data" => countries}}} = UniFi.Network.Supporting.list_countries(req)
for c <- Enum.take(countries, 10) do
  IO.puts("  #{c["code"]}  #{c["name"]}")
end
IO.puts("  ... (#{length(countries)} total)")
