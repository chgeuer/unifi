defmodule UniFi.Network.Legacy do
  @moduledoc """
  Client for the legacy (undocumented) UniFi Network controller API.

  This is the older Mongo-style API at `/proxy/network/api/s/{site}/...`
  which exposes far more data than the official integration API, including
  detailed client stats, rogue APs, port forwards, system settings, and more.

  ## Usage

      req = UniFi.Network.Legacy.client(
        base_url: "https://192.168.1.1",
        api_key: "YOUR_LOCAL_API_KEY",
        verify: false
      )

      {:ok, resp} = UniFi.Network.Legacy.Stats.clients(req)
  """

  @doc """
  Creates a configured `Req.Request` for the legacy controller API.

  ## Options

    * `:base_url` (required) — Console URL, e.g. `https://192.168.1.1`.
    * `:api_key` (required) — Your local UniFi API key.
    * `:site` — Site name (default: `"default"`).
    * `:verify` — SSL verification (default: `true`). Set to `false` for self-signed certs.
  """
  @spec client(keyword()) :: Req.Request.t()
  def client(opts) do
    base_url = Keyword.fetch!(opts, :base_url)
    api_key = Keyword.fetch!(opts, :api_key)
    site = Keyword.get(opts, :site, "default")

    req_opts = [
      base_url: "#{base_url}/proxy/network/api/s/#{site}",
      headers: [
        {"x-api-key", api_key},
        {"accept", "application/json"}
      ],
      path_params_style: :curly
    ]

    req_opts =
      if Keyword.get(opts, :verify) == false do
        Keyword.put(req_opts, :connect_options, transport_opts: [verify: :verify_none])
      else
        req_opts
      end

    Req.new(req_opts)
  end
end
