#!/usr/bin/env elixir

Mix.install([{:unifi, path: Path.join(__DIR__, "..")}])

req = UniFi.Script.legacy_client()

UniFi.Script.header("Device Stats (legacy)")
{:ok, %{body: %{"data" => devices}}} = UniFi.Network.Legacy.Stats.devices(req)
for d <- devices do
  name = d["name"] || d["mac"]
  model = d["model"] || "?"
  uptime = d["uptime"] || 0
  days = div(uptime, 86400)
  IO.puts("  #{String.pad_trailing(name, 30)} #{String.pad_trailing(model, 15)} uptime: #{days}d  load: #{d["loadavg_1"] || "?"}")
end
