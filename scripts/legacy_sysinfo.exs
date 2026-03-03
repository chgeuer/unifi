#!/usr/bin/env elixir

Mix.install([{:unifi, path: Path.join(__DIR__, "..")}])

req = UniFi.Script.legacy_client()

UniFi.Script.header("System Info")
{:ok, %{body: %{"data" => [info]}}} = UniFi.Network.Legacy.Stats.sysinfo(req)
UniFi.Script.print_item(info)
