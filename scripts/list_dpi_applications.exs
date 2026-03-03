#!/usr/bin/env elixir

Mix.install([{:unifi, path: Path.join(__DIR__, "..")}])

req = UniFi.Script.local_client()

UniFi.Script.header("DPI Applications")
{:ok, %{status: 200, body: %{"data" => apps}}} = UniFi.Network.Supporting.list_dpi_applications(req)
for a <- Enum.take(apps, 20) do
  IO.puts("  #{a["id"] || a["applicationId"]}  #{a["name"]}")
end
IO.puts("  ... (#{length(apps)} total)")
