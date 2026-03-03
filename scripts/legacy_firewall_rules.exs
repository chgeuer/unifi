#!/usr/bin/env elixir

Mix.install([{:unifi, path: Path.join(__DIR__, "..")}])

req = UniFi.Script.legacy_client()

UniFi.Script.header("Legacy Firewall Rules")
{:ok, %{body: %{"data" => rules}}} = UniFi.Network.Legacy.FirewallRules.list(req)
case rules do
  [] -> IO.puts("  (none)")
  _ -> for r <- rules, do: IO.puts("  #{r["name"] || r["_id"]}  #{r["action"]}  #{r["ruleset"]}")
end
UniFi.Script.header("Firewall Groups")
{:ok, %{body: %{"data" => groups}}} = UniFi.Network.Legacy.FirewallRules.list_groups(req)
case groups do
  [] -> IO.puts("  (none)")
  _ -> for g <- groups, do: IO.puts("  #{g["name"]}  #{g["group_type"]}")
end
