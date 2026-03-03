#!/usr/bin/env elixir

Mix.install([{:unifi, path: Path.join(__DIR__, "..")}])

req = UniFi.Script.local_client()
site_id = UniFi.Script.first_site_id(req)

UniFi.Script.header("Connected Clients")
{:ok, %{status: 200, body: %{"data" => clients}}} = UniFi.Network.Clients.list(req, site_id)

clients
|> Enum.sort_by(fn c -> String.downcase(c["name"] || c["macAddress"] || "") end)
|> Enum.each(fn c ->
  name = c["name"] || c["macAddress"]
  ip = c["ipAddress"] || "—"
  mac = c["macAddress"] || "—"
  type = c["type"] || "?"
  IO.puts("  #{String.pad_trailing(name, 35)} #{String.pad_trailing(ip, 16)} #{String.pad_trailing(mac, 18)} #{type}")
end)

# Get details for first client
case clients do
  [first | _] ->
    UniFi.Script.header("Client Details (first)")
    {:ok, %{status: 200, body: detail}} = UniFi.Network.Clients.get(req, site_id, first["id"])
    UniFi.Script.print_item(detail)
  _ -> :ok
end
