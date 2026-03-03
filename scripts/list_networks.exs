#!/usr/bin/env elixir

Mix.install([{:unifi, path: Path.join(__DIR__, "..")}])

req = UniFi.Script.local_client()
site_id = UniFi.Script.first_site_id(req)

UniFi.Script.header("Networks")
{:ok, %{status: 200, body: %{"data" => networks}}} = UniFi.Network.Networks.list(req, site_id)

for n <- networks do
  name = n["name"] || n["id"]
  vlan = n["vlan"] || "untagged"
  purpose = n["purpose"] || n["type"] || "?"
  IO.puts("  #{String.pad_trailing(name, 25)} VLAN #{String.pad_trailing(to_string(vlan), 8)} #{purpose}")
end

# Get details + references for first network
case networks do
  [first | _] ->
    UniFi.Script.header("Network Details (first)")
    {:ok, %{status: 200, body: detail}} = UniFi.Network.Networks.get(req, site_id, first["id"])
    UniFi.Script.print_item(detail)

    UniFi.Script.header("Network References (first)")
    {:ok, %{status: s, body: refs}} = UniFi.Network.Networks.get_references(req, site_id, first["id"])
    if s == 200, do: UniFi.Script.print_item(refs), else: IO.puts("  status #{s}")
  _ -> :ok
end
