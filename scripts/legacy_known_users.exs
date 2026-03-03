#!/usr/bin/env elixir

Mix.install([{:unifi, path: Path.join(__DIR__, "..")}])

req = UniFi.Script.legacy_client()

UniFi.Script.header("Known Users (historical)")
{:ok, %{body: %{"data" => users}}} = UniFi.Network.Legacy.Users.list(req)
IO.puts("  #{length(users)} known users\n")
users
|> Enum.sort_by(fn u -> String.downcase(u["name"] || u["mac"] || "") end)
|> Enum.take(20)
|> Enum.each(fn u ->
  name = u["name"] || u["mac"]
  mac = u["mac"]
  blocked = if u["blocked"], do: " [BLOCKED]", else: ""
  IO.puts("  #{String.pad_trailing(name, 35)} #{mac}#{blocked}")
end)
IO.puts("  ...")
UniFi.Script.header("User Groups")
{:ok, %{body: %{"data" => groups}}} = UniFi.Network.Legacy.Users.list_groups(req)
for g <- groups, do: IO.puts("  #{g["name"]}  (#{g["_id"]})")
