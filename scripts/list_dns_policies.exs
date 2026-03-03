#!/usr/bin/env elixir

Mix.install([{:unifi, path: Path.join(__DIR__, "..")}])

req = UniFi.Script.local_client()
site_id = UniFi.Script.first_site_id(req)

UniFi.Script.header("DNS Policies")
{:ok, %{status: 200, body: %{"data" => policies}}} = UniFi.Network.DNS.list(req, site_id)

case policies do
  [] -> IO.puts("  (none)")
  _ ->
    for p <- policies do
      name = p["name"] || p["id"]
      IO.puts("  #{name}")
    end

    UniFi.Script.header("DNS Policy Details (first)")
    {:ok, %{status: 200, body: detail}} = UniFi.Network.DNS.get(req, site_id, hd(policies)["id"])
    UniFi.Script.print_item(detail)
end
