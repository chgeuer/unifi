#!/usr/bin/env elixir

Mix.install([{:unifi, path: Path.join(__DIR__, "..")}])

req = UniFi.Script.legacy_client()

UniFi.Script.header("Client Stats (legacy, 91 fields)")
{:ok, %{body: %{"data" => clients}}} = UniFi.Network.Legacy.Stats.clients(req)
clients
|> Enum.sort_by(fn c -> String.downcase(c["hostname"] || c["name"] || c["mac"] || "") end)
|> Enum.each(fn c ->
  name = c["name"] || c["hostname"] || c["mac"]
  ip = c["ip"] || "—"
  signal = c["signal"] || "—"
  satisfaction = c["satisfaction"] || "—"
  essid = c["essid"] || (if c["is_wired"], do: "wired", else: "?")
  IO.puts("  #{String.pad_trailing(name, 35)} #{String.pad_trailing(ip, 16)} signal=#{String.pad_trailing(to_string(signal), 5)} sat=#{String.pad_trailing(to_string(satisfaction), 5)} #{essid}")
end)
