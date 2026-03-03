#!/usr/bin/env elixir

Mix.install([{:unifi, path: Path.join(__DIR__, "..")}])

req = UniFi.Script.legacy_client()

UniFi.Script.header("WLAN Configurations")
{:ok, %{body: %{"data" => wlans}}} = UniFi.Network.Legacy.WLANConf.list(req)
for w <- wlans do
  enabled = if w["enabled"], do: "✓", else: "✗"
  IO.puts("  #{enabled} #{String.pad_trailing(w["name"], 25)} security=#{w["security"]}  hide=#{w["hide_ssid"]}")
end
