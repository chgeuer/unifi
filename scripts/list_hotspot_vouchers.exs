#!/usr/bin/env elixir

Mix.install([{:unifi, path: Path.join(__DIR__, "..")}])

req = UniFi.Script.local_client()
site_id = UniFi.Script.first_site_id(req)

UniFi.Script.header("Hotspot Vouchers")
{:ok, %{status: 200, body: %{"data" => vouchers}}} = UniFi.Network.Hotspot.list_vouchers(req, site_id)

case vouchers do
  [] -> IO.puts("  (none)")
  _ ->
    for v <- vouchers do
      code = v["code"] || v["id"]
      IO.puts("  #{code}")
    end

    UniFi.Script.header("Voucher Details (first)")
    {:ok, %{status: 200, body: detail}} = UniFi.Network.Hotspot.get_voucher(req, site_id, hd(vouchers)["id"])
    UniFi.Script.print_item(detail)
end
