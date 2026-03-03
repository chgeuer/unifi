#!/usr/bin/env elixir

Mix.install([{:unifi, path: Path.join(__DIR__, "..")}])

req = UniFi.Script.local_client()

UniFi.Script.header("Application Info")
{:ok, %{status: 200, body: body}} = UniFi.Network.Info.get(req)
UniFi.Script.print_item(body)
