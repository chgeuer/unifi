defmodule UniFi.Network.Firewall do
  @moduledoc """
  Manage firewall zones and policies on a site.
  """

  # --- Zones ---

  @doc """
  List all firewall zones on a site.
  """
  @spec list_zones(Req.Request.t(), String.t(), keyword()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def list_zones(req, site_id, params \\ []) do
    Req.request(req,
      method: :get,
      url: "/v1/sites/{siteId}/firewall/zones",
      path_params_style: :curly, path_params: [siteId: site_id],
      params: params
    )
  end

  @doc """
  Get a specific firewall zone.
  """
  @spec get_zone(Req.Request.t(), String.t(), String.t()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def get_zone(req, site_id, zone_id) do
    Req.request(req,
      method: :get,
      url: "/v1/sites/{siteId}/firewall/zones/{firewallZoneId}",
      path_params_style: :curly, path_params: [siteId: site_id, firewallZoneId: zone_id]
    )
  end

  @doc """
  Create a custom firewall zone.
  """
  @spec create_zone(Req.Request.t(), String.t(), map()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def create_zone(req, site_id, body) do
    Req.request(req,
      method: :post,
      url: "/v1/sites/{siteId}/firewall/zones",
      path_params_style: :curly, path_params: [siteId: site_id],
      json: body
    )
  end

  @doc """
  Update a firewall zone.
  """
  @spec update_zone(Req.Request.t(), String.t(), String.t(), map()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def update_zone(req, site_id, zone_id, body) do
    Req.request(req,
      method: :put,
      url: "/v1/sites/{siteId}/firewall/zones/{firewallZoneId}",
      path_params_style: :curly, path_params: [siteId: site_id, firewallZoneId: zone_id],
      json: body
    )
  end

  @doc """
  Delete a custom firewall zone.
  """
  @spec delete_zone(Req.Request.t(), String.t(), String.t()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def delete_zone(req, site_id, zone_id) do
    Req.request(req,
      method: :delete,
      url: "/v1/sites/{siteId}/firewall/zones/{firewallZoneId}",
      path_params_style: :curly, path_params: [siteId: site_id, firewallZoneId: zone_id]
    )
  end

  # --- Policies ---

  @doc """
  List all firewall policies on a site.
  """
  @spec list_policies(Req.Request.t(), String.t(), keyword()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def list_policies(req, site_id, params \\ []) do
    Req.request(req,
      method: :get,
      url: "/v1/sites/{siteId}/firewall/policies",
      path_params_style: :curly, path_params: [siteId: site_id],
      params: params
    )
  end

  @doc """
  Get a specific firewall policy.
  """
  @spec get_policy(Req.Request.t(), String.t(), String.t()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def get_policy(req, site_id, policy_id) do
    Req.request(req,
      method: :get,
      url: "/v1/sites/{siteId}/firewall/policies/{firewallPolicyId}",
      path_params_style: :curly, path_params: [siteId: site_id, firewallPolicyId: policy_id]
    )
  end

  @doc """
  Create a firewall policy.
  """
  @spec create_policy(Req.Request.t(), String.t(), map()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def create_policy(req, site_id, body) do
    Req.request(req,
      method: :post,
      url: "/v1/sites/{siteId}/firewall/policies",
      path_params_style: :curly, path_params: [siteId: site_id],
      json: body
    )
  end

  @doc """
  Update a firewall policy (full replace).
  """
  @spec update_policy(Req.Request.t(), String.t(), String.t(), map()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def update_policy(req, site_id, policy_id, body) do
    Req.request(req,
      method: :put,
      url: "/v1/sites/{siteId}/firewall/policies/{firewallPolicyId}",
      path_params_style: :curly, path_params: [siteId: site_id, firewallPolicyId: policy_id],
      json: body
    )
  end

  @doc """
  Patch a firewall policy (partial update).
  """
  @spec patch_policy(Req.Request.t(), String.t(), String.t(), map()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def patch_policy(req, site_id, policy_id, body) do
    Req.request(req,
      method: :patch,
      url: "/v1/sites/{siteId}/firewall/policies/{firewallPolicyId}",
      path_params_style: :curly, path_params: [siteId: site_id, firewallPolicyId: policy_id],
      json: body
    )
  end

  @doc """
  Delete a firewall policy.
  """
  @spec delete_policy(Req.Request.t(), String.t(), String.t()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def delete_policy(req, site_id, policy_id) do
    Req.request(req,
      method: :delete,
      url: "/v1/sites/{siteId}/firewall/policies/{firewallPolicyId}",
      path_params_style: :curly, path_params: [siteId: site_id, firewallPolicyId: policy_id]
    )
  end

  # --- Policy Ordering ---

  @doc """
  Get the ordering of user-defined firewall policies.
  """
  @spec get_policy_ordering(Req.Request.t(), String.t()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def get_policy_ordering(req, site_id) do
    Req.request(req,
      method: :get,
      url: "/v1/sites/{siteId}/firewall/policies/ordering",
      path_params_style: :curly, path_params: [siteId: site_id]
    )
  end

  @doc """
  Reorder user-defined firewall policies.
  """
  @spec update_policy_ordering(Req.Request.t(), String.t(), map()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def update_policy_ordering(req, site_id, body) do
    Req.request(req,
      method: :put,
      url: "/v1/sites/{siteId}/firewall/policies/ordering",
      path_params_style: :curly, path_params: [siteId: site_id],
      json: body
    )
  end
end
