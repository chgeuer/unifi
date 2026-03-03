#!/usr/bin/env elixir

Mix.install([{:unifi, path: Path.join(__DIR__, "..")}])

req = UniFi.Script.local_client()
site_id = UniFi.Script.first_site_id(req)

UniFi.Script.header("Traffic Matching Lists")
{:ok, %{status: 200, body: %{"data" => lists}}} = UniFi.Network.TrafficMatching.list(req, site_id)

case lists do
  [] -> IO.puts("  (none)")
  _ ->
    for l <- lists do
      name = l["name"] || l["id"]
      IO.puts("  #{l["id"]}  #{name}")
    end

    UniFi.Script.header("Traffic Matching List Details (first)")
    {:ok, %{status: 200, body: detail}} = UniFi.Network.TrafficMatching.get(req, site_id, hd(lists)["id"])
    UniFi.Script.print_item(detail)
end
