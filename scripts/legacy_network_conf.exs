#!/usr/bin/env elixir

Mix.install([{:unifi, path: Path.join(__DIR__, "..")}])

req = UniFi.Script.legacy_client()

UniFi.Script.header("Network Configurations")
{:ok, %{body: %{"data" => nets}}} = UniFi.Network.Legacy.NetworkConf.list(req)
for n <- nets do
  IO.puts("  #{String.pad_trailing(n["name"], 25)} purpose=#{n["purpose"]}  #{n["_id"]}")
end
