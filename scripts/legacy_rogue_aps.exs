#!/usr/bin/env elixir

Mix.install([{:unifi, path: Path.join(__DIR__, "..")}])

req = UniFi.Script.legacy_client()

UniFi.Script.header("Rogue/Neighbor APs")
{:ok, %{body: %{"data" => aps}}} = UniFi.Network.Legacy.Stats.rogue_aps(req)
IO.puts("  #{length(aps)} detected\n")
aps
|> Enum.sort_by(& &1["rssi"] || 0, :desc)
|> Enum.take(15)
|> Enum.each(fn a ->
  ssid = a["essid"] || "(hidden)"
  IO.puts("  #{String.pad_trailing(ssid, 30)} ch#{String.pad_trailing(to_string(a["channel"] || "?"), 5)} rssi=#{a["rssi"]}  #{a["bssid"]}")
end)
