#!/usr/bin/env elixir

Mix.install([{:unifi, path: Path.join(__DIR__, "..")}])

req = UniFi.Script.legacy_client()

UniFi.Script.header("Health")
{:ok, %{body: %{"data" => items}}} = UniFi.Network.Legacy.Stats.health(req)
for h <- items do
  IO.puts("  #{String.pad_trailing(h["subsystem"], 10)} #{h["status"]}  (#{h["num_adopted"] || 0} adopted)")
end
