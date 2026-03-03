defmodule UniFi.Network.WiFi do
  @moduledoc """
  Manage WiFi broadcast configurations on a site.
  """

  @doc """
  List WiFi broadcasts on a site.
  """
  @spec list(Req.Request.t(), String.t(), keyword()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def list(req, site_id, params \\ []) do
    Req.request(req,
      method: :get,
      url: "/v1/sites/{siteId}/wifi/broadcasts",
      path_params_style: :curly, path_params: [siteId: site_id],
      params: params
    )
  end

  @doc """
  Get details of a specific WiFi broadcast.
  """
  @spec get(Req.Request.t(), String.t(), String.t()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def get(req, site_id, wifi_broadcast_id) do
    Req.request(req,
      method: :get,
      url: "/v1/sites/{siteId}/wifi/broadcasts/{wifiBroadcastId}",
      path_params_style: :curly, path_params: [siteId: site_id, wifiBroadcastId: wifi_broadcast_id]
    )
  end

  @doc """
  Create a new WiFi broadcast.
  """
  @spec create(Req.Request.t(), String.t(), map()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def create(req, site_id, body) do
    Req.request(req,
      method: :post,
      url: "/v1/sites/{siteId}/wifi/broadcasts",
      path_params_style: :curly, path_params: [siteId: site_id],
      json: body
    )
  end

  @doc """
  Update an existing WiFi broadcast.
  """
  @spec update(Req.Request.t(), String.t(), String.t(), map()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def update(req, site_id, wifi_broadcast_id, body) do
    Req.request(req,
      method: :put,
      url: "/v1/sites/{siteId}/wifi/broadcasts/{wifiBroadcastId}",
      path_params_style: :curly, path_params: [siteId: site_id, wifiBroadcastId: wifi_broadcast_id],
      json: body
    )
  end

  @doc """
  Delete a WiFi broadcast.
  """
  @spec delete(Req.Request.t(), String.t(), String.t()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def delete(req, site_id, wifi_broadcast_id) do
    Req.request(req,
      method: :delete,
      url: "/v1/sites/{siteId}/wifi/broadcasts/{wifiBroadcastId}",
      path_params_style: :curly, path_params: [siteId: site_id, wifiBroadcastId: wifi_broadcast_id]
    )
  end
end
