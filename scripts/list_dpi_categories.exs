#!/usr/bin/env elixir

Mix.install([{:unifi, path: Path.join(__DIR__, "..")}])

req = UniFi.Script.local_client()

UniFi.Script.header("DPI Application Categories")
{:ok, %{status: 200, body: %{"data" => cats}}} = UniFi.Network.Supporting.list_dpi_categories(req)
for c <- Enum.take(cats, 20) do
  IO.puts("  #{c["id"] || c["categoryId"]}  #{c["name"]}")
end
IO.puts("  ... (#{length(cats)} total)")
