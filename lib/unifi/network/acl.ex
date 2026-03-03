defmodule UniFi.Network.ACL do
  @moduledoc """
  Manage Access Control (ACL) rules on a site.
  """

  @doc """
  List all ACL rules on a site.
  """
  @spec list(Req.Request.t(), String.t(), keyword()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def list(req, site_id, params \\ []) do
    Req.request(req,
      method: :get,
      url: "/v1/sites/{siteId}/acl-rules",
      path_params_style: :curly, path_params: [siteId: site_id],
      params: params
    )
  end

  @doc """
  Get a specific ACL rule.
  """
  @spec get(Req.Request.t(), String.t(), String.t()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def get(req, site_id, acl_rule_id) do
    Req.request(req,
      method: :get,
      url: "/v1/sites/{siteId}/acl-rules/{aclRuleId}",
      path_params_style: :curly, path_params: [siteId: site_id, aclRuleId: acl_rule_id]
    )
  end

  @doc """
  Create an ACL rule.
  """
  @spec create(Req.Request.t(), String.t(), map()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def create(req, site_id, body) do
    Req.request(req,
      method: :post,
      url: "/v1/sites/{siteId}/acl-rules",
      path_params_style: :curly, path_params: [siteId: site_id],
      json: body
    )
  end

  @doc """
  Update an ACL rule.
  """
  @spec update(Req.Request.t(), String.t(), String.t(), map()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def update(req, site_id, acl_rule_id, body) do
    Req.request(req,
      method: :put,
      url: "/v1/sites/{siteId}/acl-rules/{aclRuleId}",
      path_params_style: :curly, path_params: [siteId: site_id, aclRuleId: acl_rule_id],
      json: body
    )
  end

  @doc """
  Delete an ACL rule.
  """
  @spec delete(Req.Request.t(), String.t(), String.t()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def delete(req, site_id, acl_rule_id) do
    Req.request(req,
      method: :delete,
      url: "/v1/sites/{siteId}/acl-rules/{aclRuleId}",
      path_params_style: :curly, path_params: [siteId: site_id, aclRuleId: acl_rule_id]
    )
  end

  @doc """
  Get the ordering of user-defined ACL rules.
  """
  @spec get_ordering(Req.Request.t(), String.t()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def get_ordering(req, site_id) do
    Req.request(req,
      method: :get,
      url: "/v1/sites/{siteId}/acl-rules/ordering",
      path_params_style: :curly, path_params: [siteId: site_id]
    )
  end

  @doc """
  Reorder user-defined ACL rules.
  """
  @spec update_ordering(Req.Request.t(), String.t(), map()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def update_ordering(req, site_id, body) do
    Req.request(req,
      method: :put,
      url: "/v1/sites/{siteId}/acl-rules/ordering",
      path_params_style: :curly, path_params: [siteId: site_id],
      json: body
    )
  end
end
