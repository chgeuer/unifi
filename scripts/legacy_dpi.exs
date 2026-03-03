#!/usr/bin/env elixir

Mix.install([{:unifi, path: Path.join(__DIR__, "..")}])

req = UniFi.Script.legacy_client()

UniFi.Script.header("DPI Statistics")
{:ok, %{body: %{"data" => dpi}}} = UniFi.Network.Legacy.Stats.dpi(req)
case dpi do
  [] -> IO.puts("  (none)")
  _ -> for d <- dpi, do: UniFi.Script.print_item(d)
end
