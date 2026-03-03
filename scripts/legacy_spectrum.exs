#!/usr/bin/env elixir

Mix.install([{:unifi, path: Path.join(__DIR__, "..")}])

req = UniFi.Script.legacy_client()

UniFi.Script.header("Spectrum Scan")
{:ok, %{body: %{"data" => scans}}} = UniFi.Network.Legacy.Stats.spectrum_scan(req)
for s <- scans do
  IO.puts("  #{s["mac"]}  channels: #{length(s["spectrum_table"] || [])}")
end
