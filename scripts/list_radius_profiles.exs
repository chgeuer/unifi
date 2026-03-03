#!/usr/bin/env elixir

Mix.install([{:unifi, path: Path.join(__DIR__, "..")}])

req = UniFi.Script.local_client()
site_id = UniFi.Script.first_site_id(req)

UniFi.Script.header("RADIUS Profiles")
{:ok, %{status: 200, body: %{"data" => profiles}}} = UniFi.Network.Supporting.list_radius_profiles(req, site_id)

case profiles do
  [] -> IO.puts("  (none)")
  _ -> for p <- profiles, do: UniFi.Script.print_item(p)
end
