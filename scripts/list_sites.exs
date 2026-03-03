#!/usr/bin/env elixir

Mix.install([{:unifi, path: Path.join(__DIR__, "..")}])

req = UniFi.Script.local_client()

UniFi.Script.header("Local Sites")
{:ok, %{status: 200, body: %{"data" => sites}}} = UniFi.Network.Sites.list(req)
for site <- sites do
  IO.puts("  #{site["id"]}  #{site["name"]}")
end
