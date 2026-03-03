#!/usr/bin/env elixir

Mix.install([{:unifi, path: Path.join(__DIR__, "..")}])

req = UniFi.Script.legacy_client()

UniFi.Script.header("Events")
{:ok, %{body: %{"data" => events}}} = UniFi.Network.Legacy.Stats.events(req)
case events do
  [] -> IO.puts("  (none)")
  _ -> for e <- Enum.take(events, 20), do: IO.puts("  #{e["datetime"]}  #{e["msg"] || e["key"]}")
end
