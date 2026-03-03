defmodule UniFi.Network.Networks do
  @moduledoc """
  Manage network configurations (VLANs, subnets) on a site.
  """

  @doc """
  List all networks on a site.
  """
  @spec list(Req.Request.t(), String.t(), keyword()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def list(req, site_id, params \\ []) do
    Req.request(req,
      method: :get,
      url: "/v1/sites/{siteId}/networks",
      path_params_style: :curly, path_params: [siteId: site_id],
      params: params
    )
  end

  @doc """
  Get details of a specific network.
  """
  @spec get(Req.Request.t(), String.t(), String.t()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def get(req, site_id, network_id) do
    Req.request(req,
      method: :get,
      url: "/v1/sites/{siteId}/networks/{networkId}",
      path_params_style: :curly, path_params: [siteId: site_id, networkId: network_id]
    )
  end

  @doc """
  Create a new network on a site.
  """
  @spec create(Req.Request.t(), String.t(), map()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def create(req, site_id, body) do
    Req.request(req,
      method: :post,
      url: "/v1/sites/{siteId}/networks",
      path_params_style: :curly, path_params: [siteId: site_id],
      json: body
    )
  end

  @doc """
  Update an existing network.
  """
  @spec update(Req.Request.t(), String.t(), String.t(), map()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def update(req, site_id, network_id, body) do
    Req.request(req,
      method: :put,
      url: "/v1/sites/{siteId}/networks/{networkId}",
      path_params_style: :curly, path_params: [siteId: site_id, networkId: network_id],
      json: body
    )
  end

  @doc """
  Delete a network.
  """
  @spec delete(Req.Request.t(), String.t(), String.t()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def delete(req, site_id, network_id) do
    Req.request(req,
      method: :delete,
      url: "/v1/sites/{siteId}/networks/{networkId}",
      path_params_style: :curly, path_params: [siteId: site_id, networkId: network_id]
    )
  end

  @doc """
  Get references for a network (which resources use this network).
  """
  @spec get_references(Req.Request.t(), String.t(), String.t()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def get_references(req, site_id, network_id) do
    Req.request(req,
      method: :get,
      url: "/v1/sites/{siteId}/networks/{networkId}/references",
      path_params_style: :curly, path_params: [siteId: site_id, networkId: network_id]
    )
  end
end
