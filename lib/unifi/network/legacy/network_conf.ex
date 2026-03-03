defmodule UniFi.Network.Legacy.NetworkConf do
  @moduledoc """
  Manage network configurations via the legacy API.

  Provides access to full network config objects (WAN, LAN, VPN)
  with all fields not exposed by the official integration API.
  """

  @doc """
  List all network configurations.
  """
  @spec list(Req.Request.t()) :: {:ok, Req.Response.t()} | {:error, Exception.t()}
  def list(req) do
    Req.request(req, method: :get, url: "/rest/networkconf")
  end

  @doc """
  Get a specific network configuration by `_id`.
  """
  @spec get(Req.Request.t(), String.t()) :: {:ok, Req.Response.t()} | {:error, Exception.t()}
  def get(req, id) do
    Req.request(req, method: :get, url: "/rest/networkconf/{id}", path_params_style: :curly, path_params: [id: id])
  end

  @doc """
  Create a network configuration.
  """
  @spec create(Req.Request.t(), map()) :: {:ok, Req.Response.t()} | {:error, Exception.t()}
  def create(req, body) do
    Req.request(req, method: :post, url: "/rest/networkconf", json: body)
  end

  @doc """
  Update a network configuration.
  """
  @spec update(Req.Request.t(), String.t(), map()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def update(req, id, body) do
    Req.request(req, method: :put, url: "/rest/networkconf/{id}", path_params_style: :curly, path_params: [id: id], json: body)
  end

  @doc """
  Delete a network configuration.
  """
  @spec delete(Req.Request.t(), String.t()) :: {:ok, Req.Response.t()} | {:error, Exception.t()}
  def delete(req, id) do
    Req.request(req, method: :delete, url: "/rest/networkconf/{id}", path_params_style: :curly, path_params: [id: id])
  end
end
