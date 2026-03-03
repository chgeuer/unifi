defmodule UniFi.Network.Legacy.WLANConf do
  @moduledoc """
  Manage WLAN configurations via the legacy API.

  Provides access to the full WLAN config objects with all fields
  not exposed by the official WiFi broadcasts integration API.
  """

  @doc """
  List all WLAN configurations.
  """
  @spec list(Req.Request.t()) :: {:ok, Req.Response.t()} | {:error, Exception.t()}
  def list(req) do
    Req.request(req, method: :get, url: "/rest/wlanconf")
  end

  @doc """
  Get a specific WLAN configuration by `_id`.
  """
  @spec get(Req.Request.t(), String.t()) :: {:ok, Req.Response.t()} | {:error, Exception.t()}
  def get(req, id) do
    Req.request(req, method: :get, url: "/rest/wlanconf/{id}", path_params_style: :curly, path_params: [id: id])
  end

  @doc """
  Update a WLAN configuration.
  """
  @spec update(Req.Request.t(), String.t(), map()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def update(req, id, body) do
    Req.request(req, method: :put, url: "/rest/wlanconf/{id}", path_params_style: :curly, path_params: [id: id], json: body)
  end
end
