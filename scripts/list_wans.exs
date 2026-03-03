#!/usr/bin/env elixir

Mix.install([{:unifi, path: Path.join(__DIR__, "..")}])

req = UniFi.Script.local_client()
site_id = UniFi.Script.first_site_id(req)

UniFi.Script.header("WAN Interfaces")
{:ok, %{status: 200, body: %{"data" => wans}}} = UniFi.Network.Supporting.list_wans(req, site_id)

for w <- wans do
  name = w["name"] || w["id"]
  ip = w["ipAddress"] || w["address"] || "—"
  IO.puts("  #{String.pad_trailing(name, 20)} #{ip}")
end
