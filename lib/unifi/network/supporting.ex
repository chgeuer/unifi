defmodule UniFi.Network.Supporting do
  @moduledoc """
  Supporting/read-only resources: WANs, VPNs, RADIUS profiles,
  device tags, DPI categories, and country lists.
  """

  @doc """
  List WAN interfaces on a site.
  """
  @spec list_wans(Req.Request.t(), String.t(), keyword()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def list_wans(req, site_id, params \\ []) do
    Req.request(req,
      method: :get,
      url: "/v1/sites/{siteId}/wans",
      path_params_style: :curly, path_params: [siteId: site_id],
      params: params
    )
  end

  @doc """
  List site-to-site VPN tunnels.
  """
  @spec list_vpn_tunnels(Req.Request.t(), String.t(), keyword()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def list_vpn_tunnels(req, site_id, params \\ []) do
    Req.request(req,
      method: :get,
      url: "/v1/sites/{siteId}/vpn/site-to-site-tunnels",
      path_params_style: :curly, path_params: [siteId: site_id],
      params: params
    )
  end

  @doc """
  List VPN servers.
  """
  @spec list_vpn_servers(Req.Request.t(), String.t(), keyword()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def list_vpn_servers(req, site_id, params \\ []) do
    Req.request(req,
      method: :get,
      url: "/v1/sites/{siteId}/vpn/servers",
      path_params_style: :curly, path_params: [siteId: site_id],
      params: params
    )
  end

  @doc """
  List RADIUS profiles.
  """
  @spec list_radius_profiles(Req.Request.t(), String.t(), keyword()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def list_radius_profiles(req, site_id, params \\ []) do
    Req.request(req,
      method: :get,
      url: "/v1/sites/{siteId}/radius/profiles",
      path_params_style: :curly, path_params: [siteId: site_id],
      params: params
    )
  end

  @doc """
  List device tags.
  """
  @spec list_device_tags(Req.Request.t(), String.t(), keyword()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def list_device_tags(req, site_id, params \\ []) do
    Req.request(req,
      method: :get,
      url: "/v1/sites/{siteId}/device-tags",
      path_params_style: :curly, path_params: [siteId: site_id],
      params: params
    )
  end

  @doc """
  List DPI application categories.
  """
  @spec list_dpi_categories(Req.Request.t(), keyword()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def list_dpi_categories(req, params \\ []) do
    Req.request(req,
      method: :get,
      url: "/v1/dpi/categories",
      params: params
    )
  end

  @doc """
  List DPI applications.
  """
  @spec list_dpi_applications(Req.Request.t(), keyword()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def list_dpi_applications(req, params \\ []) do
    Req.request(req,
      method: :get,
      url: "/v1/dpi/applications",
      params: params
    )
  end

  @doc """
  List countries.
  """
  @spec list_countries(Req.Request.t(), keyword()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def list_countries(req, params \\ []) do
    Req.request(req,
      method: :get,
      url: "/v1/countries",
      params: params
    )
  end
end
