defmodule UniFi.Network.DNS do
  @moduledoc """
  Manage DNS policies on a site.
  """

  @doc """
  List all DNS policies on a site.
  """
  @spec list(Req.Request.t(), String.t(), keyword()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def list(req, site_id, params \\ []) do
    Req.request(req,
      method: :get,
      url: "/v1/sites/{siteId}/dns/policies",
      path_params_style: :curly, path_params: [siteId: site_id],
      params: params
    )
  end

  @doc """
  Get a specific DNS policy.
  """
  @spec get(Req.Request.t(), String.t(), String.t()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def get(req, site_id, dns_policy_id) do
    Req.request(req,
      method: :get,
      url: "/v1/sites/{siteId}/dns/policies/{dnsPolicyId}",
      path_params_style: :curly, path_params: [siteId: site_id, dnsPolicyId: dns_policy_id]
    )
  end

  @doc """
  Create a DNS policy.
  """
  @spec create(Req.Request.t(), String.t(), map()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def create(req, site_id, body) do
    Req.request(req,
      method: :post,
      url: "/v1/sites/{siteId}/dns/policies",
      path_params_style: :curly, path_params: [siteId: site_id],
      json: body
    )
  end

  @doc """
  Update a DNS policy.
  """
  @spec update(Req.Request.t(), String.t(), String.t(), map()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def update(req, site_id, dns_policy_id, body) do
    Req.request(req,
      method: :put,
      url: "/v1/sites/{siteId}/dns/policies/{dnsPolicyId}",
      path_params_style: :curly, path_params: [siteId: site_id, dnsPolicyId: dns_policy_id],
      json: body
    )
  end

  @doc """
  Delete a DNS policy.
  """
  @spec delete(Req.Request.t(), String.t(), String.t()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def delete(req, site_id, dns_policy_id) do
    Req.request(req,
      method: :delete,
      url: "/v1/sites/{siteId}/dns/policies/{dnsPolicyId}",
      path_params_style: :curly, path_params: [siteId: site_id, dnsPolicyId: dns_policy_id]
    )
  end
end
