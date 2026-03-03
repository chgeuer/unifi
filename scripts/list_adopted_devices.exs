#!/usr/bin/env elixir

Mix.install([{:unifi, path: Path.join(__DIR__, "..")}])

req = UniFi.Script.local_client()
site_id = UniFi.Script.first_site_id(req)

UniFi.Script.header("Adopted Devices")
{:ok, %{status: 200, body: %{"data" => devices}}} = UniFi.Network.Devices.list(req, site_id)

for d <- devices do
  name = d["name"] || d["macAddress"]
  model = d["model"] || "?"
  ip = d["ipAddress"] || "—"
  state = d["state"] || "?"
  IO.puts("  #{String.pad_trailing(name, 30)} #{String.pad_trailing(model, 15)} #{String.pad_trailing(ip, 16)} #{state}")
end

# Get details + stats for first device
case devices do
  [first | _] ->
    UniFi.Script.header("Device Details (first)")
    {:ok, %{status: 200, body: detail}} = UniFi.Network.Devices.get(req, site_id, first["id"])
    UniFi.Script.print_item(detail)

    UniFi.Script.header("Device Statistics (first)")
    {:ok, %{status: s, body: stats}} = UniFi.Network.Devices.get_latest_statistics(req, site_id, first["id"])
    if s == 200, do: UniFi.Script.print_item(stats), else: IO.puts("  status #{s}: #{inspect(stats)}")
  _ -> :ok
end
