#!/usr/bin/env elixir

Mix.install([{:unifi, path: Path.join(__DIR__, "..")}])

req = UniFi.Script.legacy_client()

UniFi.Script.header("Alarms")
{:ok, %{body: %{"data" => alarms}}} = UniFi.Network.Legacy.Stats.alarms(req)
case alarms do
  [] -> IO.puts("  (none)")
  _ -> for a <- Enum.take(alarms, 20), do: IO.puts("  #{a["datetime"]}  #{a["msg"] || a["key"]}")
end
