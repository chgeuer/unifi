#!/usr/bin/env elixir

Mix.install([{:unifi, path: Path.join(__DIR__, "..")}])

req = UniFi.Script.legacy_client()

UniFi.Script.header("Settings")
{:ok, %{body: %{"data" => settings}}} = UniFi.Network.Legacy.Settings.list(req)
for s <- settings do
  IO.puts("  #{String.pad_trailing(s["key"], 30)} #{s["_id"]}")
end
