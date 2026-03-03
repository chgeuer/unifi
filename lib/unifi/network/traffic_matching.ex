defmodule UniFi.Network.TrafficMatching do
  @moduledoc """
  Manage traffic matching lists on a site.
  """

  @doc """
  List all traffic matching lists on a site.
  """
  @spec list(Req.Request.t(), String.t(), keyword()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def list(req, site_id, params \\ []) do
    Req.request(req,
      method: :get,
      url: "/v1/sites/{siteId}/traffic-matching-lists",
      path_params_style: :curly, path_params: [siteId: site_id],
      params: params
    )
  end

  @doc """
  Get a specific traffic matching list.
  """
  @spec get(Req.Request.t(), String.t(), String.t()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def get(req, site_id, list_id) do
    Req.request(req,
      method: :get,
      url: "/v1/sites/{siteId}/traffic-matching-lists/{trafficMatchingListId}",
      path_params_style: :curly, path_params: [siteId: site_id, trafficMatchingListId: list_id]
    )
  end

  @doc """
  Create a traffic matching list.
  """
  @spec create(Req.Request.t(), String.t(), map()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def create(req, site_id, body) do
    Req.request(req,
      method: :post,
      url: "/v1/sites/{siteId}/traffic-matching-lists",
      path_params_style: :curly, path_params: [siteId: site_id],
      json: body
    )
  end

  @doc """
  Update a traffic matching list.
  """
  @spec update(Req.Request.t(), String.t(), String.t(), map()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def update(req, site_id, list_id, body) do
    Req.request(req,
      method: :put,
      url: "/v1/sites/{siteId}/traffic-matching-lists/{trafficMatchingListId}",
      path_params_style: :curly, path_params: [siteId: site_id, trafficMatchingListId: list_id],
      json: body
    )
  end

  @doc """
  Delete a traffic matching list.
  """
  @spec delete(Req.Request.t(), String.t(), String.t()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def delete(req, site_id, list_id) do
    Req.request(req,
      method: :delete,
      url: "/v1/sites/{siteId}/traffic-matching-lists/{trafficMatchingListId}",
      path_params_style: :curly, path_params: [siteId: site_id, trafficMatchingListId: list_id]
    )
  end
end
