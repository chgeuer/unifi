#!/usr/bin/env elixir

Mix.install([{:unifi, path: Path.join(__DIR__, "..")}])

req = UniFi.Script.local_client()
site_id = UniFi.Script.first_site_id(req)

UniFi.Script.header("Firewall Policies")

case UniFi.Network.Firewall.list_policies(req, site_id) do
  {:ok, %{status: 200, body: %{"data" => policies}}} ->
    for p <- policies do
      name = p["name"] || p["id"]
      action = p["action"] || "?"
      enabled = if p["enabled"] != false, do: "✓", else: "✗"
      IO.puts("  #{enabled} #{String.pad_trailing(name, 35)} #{action}")
    end

    UniFi.Script.header("Firewall Policy Ordering")
    {:ok, %{status: s, body: ordering}} = UniFi.Network.Firewall.get_policy_ordering(req, site_id)
    if s == 200, do: UniFi.Script.print_item(ordering), else: IO.puts("  status #{s}")

    case policies do
      [first | _] ->
        UniFi.Script.header("Firewall Policy Details (first)")
        {:ok, %{status: 200, body: detail}} = UniFi.Network.Firewall.get_policy(req, site_id, first["id"])
        UniFi.Script.print_item(detail)
      _ -> :ok
    end

  {:ok, %{status: s, body: %{"message" => msg}}} ->
    IO.puts("  (#{s}: #{msg})")

  {:ok, %{status: s}} ->
    IO.puts("  (status #{s})")
end
