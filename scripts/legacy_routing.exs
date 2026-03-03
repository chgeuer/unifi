#!/usr/bin/env elixir

Mix.install([{:unifi, path: Path.join(__DIR__, "..")}])

req = UniFi.Script.legacy_client()

UniFi.Script.header("Static Routes")
{:ok, %{body: %{"data" => routes}}} = UniFi.Network.Legacy.Routing.list(req)
case routes do
  [] -> IO.puts("  (none)")
  _ -> for r <- routes, do: UniFi.Script.print_item(r)
end
UniFi.Script.header("Routing Stats")
{:ok, %{body: %{"data" => stats}}} = UniFi.Network.Legacy.Routing.stats(req)
case stats do
  [] -> IO.puts("  (none)")
  _ -> for s <- stats, do: UniFi.Script.print_item(s)
end
