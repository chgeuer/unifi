#!/usr/bin/env elixir

Mix.install([{:unifi, path: Path.join(__DIR__, "..")}])

req = UniFi.Script.local_client()
site_id = UniFi.Script.first_site_id(req)

UniFi.Script.header("WiFi Broadcasts")
{:ok, %{status: 200, body: %{"data" => broadcasts}}} = UniFi.Network.WiFi.list(req, site_id)

for b <- broadcasts do
  name = b["name"] || b["id"]
  enabled = if b["enabled"] != false, do: "✓", else: "✗"
  band = b["band"] || "?"
  IO.puts("  #{enabled} #{String.pad_trailing(name, 30)} #{band}")
end

case broadcasts do
  [first | _] ->
    UniFi.Script.header("WiFi Broadcast Details (first)")
    {:ok, %{status: 200, body: detail}} = UniFi.Network.WiFi.get(req, site_id, first["id"])
    UniFi.Script.print_item(detail)
  _ -> :ok
end
