#!/usr/bin/env elixir

Mix.install([{:unifi, path: Path.join(__DIR__, "..")}])

req = UniFi.Script.legacy_client()

UniFi.Script.header("Port Forwards")
{:ok, %{body: %{"data" => fwds}}} = UniFi.Network.Legacy.PortForwards.list(req)
case fwds do
  [] -> IO.puts("  (none)")
  _ ->
    for f <- fwds do
      enabled = if f["enabled"], do: "✓", else: "✗"
      IO.puts("  #{enabled} #{String.pad_trailing(f["name"] || "unnamed", 25)} #{f["proto"]} :#{f["dst_port"]} -> #{f["fwd"]}:#{f["fwd_port"]}")
    end
end
