#!/usr/bin/env elixir

Mix.install([{:unifi, path: Path.join(__DIR__, "..")}])

req = UniFi.Script.local_client()
site_id = UniFi.Script.first_site_id(req)

UniFi.Script.header("VPN Servers")
{:ok, %{status: 200, body: %{"data" => servers}}} = UniFi.Network.Supporting.list_vpn_servers(req, site_id)

case servers do
  [] -> IO.puts("  (none)")
  _ ->
    for s <- servers do
      name = s["name"] || s["id"]
      type = s["type"] || "?"
      IO.puts("  #{String.pad_trailing(name, 25)} #{type}")
    end
end
