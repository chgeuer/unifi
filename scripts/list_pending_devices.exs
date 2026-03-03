#!/usr/bin/env elixir

Mix.install([{:unifi, path: Path.join(__DIR__, "..")}])

req = UniFi.Script.local_client()

UniFi.Script.header("Devices Pending Adoption")
{:ok, %{status: 200, body: %{"data" => devices}}} = UniFi.Network.Devices.list_pending(req)
case devices do
  [] -> IO.puts("  (none)")
  _ -> for d <- devices, do: UniFi.Script.print_item(d)
end
