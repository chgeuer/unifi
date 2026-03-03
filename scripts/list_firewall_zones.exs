#!/usr/bin/env elixir

Mix.install([{:unifi, path: Path.join(__DIR__, "..")}])

req = UniFi.Script.local_client()
site_id = UniFi.Script.first_site_id(req)

UniFi.Script.header("Firewall Zones")

case UniFi.Network.Firewall.list_zones(req, site_id) do
  {:ok, %{status: 200, body: %{"data" => zones}}} ->
    for z <- zones do
      IO.puts("  #{z["id"]}  #{z["name"] || z["id"]}")
    end

    case zones do
      [first | _] ->
        UniFi.Script.header("Firewall Zone Details (first)")
        {:ok, %{status: 200, body: detail}} = UniFi.Network.Firewall.get_zone(req, site_id, first["id"])
        UniFi.Script.print_item(detail)
      _ -> :ok
    end

  {:ok, %{status: s, body: %{"message" => msg}}} ->
    IO.puts("  (#{s}: #{msg})")

  {:ok, %{status: s}} ->
    IO.puts("  (status #{s})")
end
