defmodule UniFi.Network.System do
  @moduledoc """
  UniFi OS system-level API at `/api/system`.

  Provides console-level information (not network-application-specific).
  """

  @doc """
  Creates a `Req.Request` for the UniFi OS system API.

  ## Options

    * `:base_url` (required) — Console URL, e.g. `https://192.168.1.1`.
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
      ]
    ]

    req_opts =
      if Keyword.get(opts, :verify) == false do
        Keyword.put(req_opts, :connect_options, transport_opts: [verify: :verify_none])
      else
        req_opts
      end

    Req.new(req_opts)
  end

  @doc """
  Get system information (model, name, MAC, cloud status, direct connect domain, etc.).
  """
  @spec info(Req.Request.t()) :: {:ok, Req.Response.t()} | {:error, Exception.t()}
  def info(req) do
    Req.request(req, method: :get, url: "/api/system")
  end
end
