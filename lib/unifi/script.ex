defmodule UniFi.Script do
  @moduledoc false

  @doc """
  Creates a configured Req client for local Network API scripts.

  Uses `UNIFI_LOCAL_API_KEY` (or `UNIFI_API_KEY`) and `UNIFI_CONSOLE_URL`
  (default: `https://192.168.1.1`).
  """
  def local_client do
    api_key = System.fetch_env!("UNIFI_LOCAL_API_KEY")
    console_url = System.get_env("UNIFI_CONSOLE_URL", "https://192.168.1.1")

    UniFi.Network.client(
      base_url: console_url <> "/proxy/network/integration",
      api_key: api_key,
      verify: false
    )
  end

  @doc """
  Creates a configured legacy API client.
  """
  def legacy_client do
    api_key = System.fetch_env!("UNIFI_LOCAL_API_KEY")
    console_url = System.get_env("UNIFI_CONSOLE_URL", "https://192.168.1.1")

    UniFi.Network.Legacy.client(
      base_url: console_url,
      api_key: api_key,
      verify: false
    )
  end

  @doc """
  Creates a configured system API client.
  """
  def system_client do
    api_key = System.fetch_env!("UNIFI_LOCAL_API_KEY")
    console_url = System.get_env("UNIFI_CONSOLE_URL", "https://192.168.1.1")

    UniFi.Network.System.client(
      base_url: console_url,
      api_key: api_key,
      verify: false
    )
  end

  @doc """
  Returns the first site ID from the local controller.
  """
  def first_site_id(req) do
    {:ok, %{status: 200, body: %{"data" => [site | _]}}} = UniFi.Network.Sites.list(req)
    site["id"]
  end

  @doc """
  Prints a section header.
  """
  def header(text) do
    IO.puts("\n\e[1m#{text}\e[0m")
    IO.puts(String.duplicate("─", String.length(text)))
  end

  @doc """
  Pretty-prints a map with selected keys, or the full map if no keys given.
  """
  def print_item(item, keys \\ []) do
    display =
      if keys == [],
        do: item,
        else: Map.take(item, keys)

    for {k, v} <- Enum.sort(display) do
      IO.puts("  #{String.pad_trailing(to_string(k), 25)} #{inspect(v)}")
    end

    IO.puts("")
  end
end
