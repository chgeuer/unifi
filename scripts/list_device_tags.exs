#!/usr/bin/env elixir

Mix.install([{:unifi, path: Path.join(__DIR__, "..")}])

req = UniFi.Script.local_client()
site_id = UniFi.Script.first_site_id(req)

UniFi.Script.header("Device Tags")
{:ok, %{status: 200, body: %{"data" => tags}}} = UniFi.Network.Supporting.list_device_tags(req, site_id)

case tags do
  [] -> IO.puts("  (none)")
  _ ->
    for t <- tags do
      IO.puts("  #{t["id"]}  #{t["name"]}")
    end
end
