defmodule UniFi.Network do
  @moduledoc """
  Client for the UniFi Network local API.

  The Network API runs locally on each UniFi OS console.
  On consoles like UDM/UDM Pro, the integration API is served at
  `/proxy/network/integration`.

  ## Usage

      req = UniFi.Network.client(
        base_url: "https://192.168.1.1/proxy/network/integration",
        api_key: "YOUR_LOCAL_API_KEY",
        verify: false
      )
      {:ok, resp} = UniFi.Network.Sites.list(req)
  """

  @doc """
  Creates a configured `Req.Request` for the Network API.

  ## Options

    * `:base_url` (required) — Console URL including proxy path, e.g.
      `https://192.168.1.1/proxy/network/integration`.
    * `:api_key` (required) — Your local UniFi API key.
    * `:verify` — SSL verification (default: `true`). Set to `false` for self-signed certs.
  """
  @spec client(keyword()) :: Req.Request.t()
  def client(opts) do
    base_url = Keyword.fetch!(opts, :base_url)
    api_key = Keyword.fetch!(opts, :api_key)

    req_opts = [
      base_url: base_url,
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
