#!/usr/bin/env elixir

Mix.install([{:unifi, path: Path.join(__DIR__, "..")}])

req = UniFi.Script.system_client()
UniFi.Script.header("UniFi OS System Info")
{:ok, %{status: 200, body: info}} = UniFi.Network.System.info(req)
UniFi.Script.print_item(info)
