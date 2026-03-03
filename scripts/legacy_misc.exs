#!/usr/bin/env elixir

Mix.install([{:unifi, path: Path.join(__DIR__, "..")}])

req = UniFi.Script.legacy_client()

UniFi.Script.header("Port Profiles")
{:ok, %{body: %{"data" => d}}} = UniFi.Network.Legacy.Misc.list_port_profiles(req)
IO.puts("  #{length(d)} profiles")
UniFi.Script.header("Dynamic DNS")
{:ok, %{body: %{"data" => d}}} = UniFi.Network.Legacy.Misc.list_dynamic_dns(req)
case d do [] -> IO.puts("  (none)"); _ -> for i <- d, do: UniFi.Script.print_item(i) end
UniFi.Script.header("RADIUS Profiles")
{:ok, %{body: %{"data" => d}}} = UniFi.Network.Legacy.Misc.list_radius_profiles(req)
for r <- d, do: IO.puts("  #{r["name"]}  #{r["_id"]}")
UniFi.Script.header("Hotspot Operators")
{:ok, %{body: %{"data" => d}}} = UniFi.Network.Legacy.Misc.list_hotspot_operators(req)
case d do [] -> IO.puts("  (none)"); _ -> for i <- d, do: UniFi.Script.print_item(i) end
UniFi.Script.header("Tags")
{:ok, %{body: %{"data" => d}}} = UniFi.Network.Legacy.Misc.list_tags(req)
case d do [] -> IO.puts("  (none)"); _ -> for i <- d, do: IO.puts("  #{i["name"]}") end
UniFi.Script.header("Channel Plans")
{:ok, %{body: %{"data" => d}}} = UniFi.Network.Legacy.Misc.list_channel_plans(req)
IO.puts("  #{length(d)} plans")
UniFi.Script.header("Self")
{:ok, %{body: %{"data" => [self]}}} = UniFi.Network.Legacy.Misc.self(req)
UniFi.Script.print_item(self, ["name", "email", "email_alert_enabled", "is_super", "role"])
