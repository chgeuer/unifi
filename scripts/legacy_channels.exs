#!/usr/bin/env elixir

Mix.install([{:unifi, path: Path.join(__DIR__, "..")}])

req = UniFi.Script.legacy_client()

UniFi.Script.header("Current Channel Usage")
{:ok, %{body: %{"data" => channels}}} = UniFi.Network.Legacy.Stats.current_channels(req)
for c <- channels, do: UniFi.Script.print_item(c)
