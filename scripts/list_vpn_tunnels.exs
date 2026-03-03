#!/usr/bin/env elixir

Mix.install([{:unifi, path: Path.join(__DIR__, "..")}])

req = UniFi.Script.local_client()
site_id = UniFi.Script.first_site_id(req)

UniFi.Script.header("Site-to-Site VPN Tunnels")
{:ok, %{status: 200, body: %{"data" => tunnels}}} = UniFi.Network.Supporting.list_vpn_tunnels(req, site_id)

case tunnels do
  [] -> IO.puts("  (none)")
  _ -> for t <- tunnels, do: UniFi.Script.print_item(t)
end
