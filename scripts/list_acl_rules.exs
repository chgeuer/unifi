#!/usr/bin/env elixir

Mix.install([{:unifi, path: Path.join(__DIR__, "..")}])

req = UniFi.Script.local_client()
site_id = UniFi.Script.first_site_id(req)

UniFi.Script.header("ACL Rules")
{:ok, %{status: 200, body: %{"data" => rules}}} = UniFi.Network.ACL.list(req, site_id)

for r <- rules do
  name = r["name"] || r["id"]
  action = r["action"] || "?"
  IO.puts("  #{String.pad_trailing(name, 35)} #{action}")
end

UniFi.Script.header("ACL Rule Ordering")
{:ok, %{status: s, body: ordering}} = UniFi.Network.ACL.get_ordering(req, site_id)
if s == 200, do: UniFi.Script.print_item(ordering), else: IO.puts("  status #{s}")

case rules do
  [first | _] ->
    UniFi.Script.header("ACL Rule Details (first)")
    {:ok, %{status: 200, body: detail}} = UniFi.Network.ACL.get(req, site_id, first["id"])
    UniFi.Script.print_item(detail)
  _ -> :ok
end
