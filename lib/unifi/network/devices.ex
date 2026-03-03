defmodule UniFi.Network.Devices do
  @moduledoc """
  Manage UniFi devices on a site.

  ## Examples

      req = UniFi.Network.client(base_url: "https://192.168.1.1", api_key: "KEY")
      {:ok, resp} = UniFi.Network.Devices.list(req, "site-id")
      {:ok, resp} = UniFi.Network.Devices.get(req, "site-id", "device-id")
  """

  @doc """
  List adopted devices on a site.
  """
  @spec list(Req.Request.t(), String.t(), keyword()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def list(req, site_id, params \\ []) do
    Req.request(req,
      method: :get,
      url: "/v1/sites/{siteId}/devices",
      path_params_style: :curly, path_params: [siteId: site_id],
      params: params
    )
  end

  @doc """
  Get details of a specific adopted device.
  """
  @spec get(Req.Request.t(), String.t(), String.t()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def get(req, site_id, device_id) do
    Req.request(req,
      method: :get,
      url: "/v1/sites/{siteId}/devices/{deviceId}",
      path_params_style: :curly, path_params: [siteId: site_id, deviceId: device_id]
    )
  end

  @doc """
  Adopt devices to a site.

  ## Parameters

    * `body` — Map with device adoption details (e.g., MAC addresses).
  """
  @spec adopt(Req.Request.t(), String.t(), map()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def adopt(req, site_id, body) do
    Req.request(req,
      method: :post,
      url: "/v1/sites/{siteId}/devices",
      path_params_style: :curly, path_params: [siteId: site_id],
      json: body
    )
  end

  @doc """
  Remove (unadopt) a device from a site.
  """
  @spec remove(Req.Request.t(), String.t(), String.t()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def remove(req, site_id, device_id) do
    Req.request(req,
      method: :delete,
      url: "/v1/sites/{siteId}/devices/{deviceId}",
      path_params_style: :curly, path_params: [siteId: site_id, deviceId: device_id]
    )
  end

  @doc """
  Execute an action on an adopted device (e.g., restart, upgrade).
  """
  @spec execute_action(Req.Request.t(), String.t(), String.t(), map()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def execute_action(req, site_id, device_id, body) do
    Req.request(req,
      method: :post,
      url: "/v1/sites/{siteId}/devices/{deviceId}/actions",
      path_params_style: :curly, path_params: [siteId: site_id, deviceId: device_id],
      json: body
    )
  end

  @doc """
  Execute a port action on a device interface.
  """
  @spec execute_port_action(Req.Request.t(), String.t(), String.t(), integer(), map()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def execute_port_action(req, site_id, device_id, port_idx, body) do
    Req.request(req,
      method: :post,
      url: "/v1/sites/{siteId}/devices/{deviceId}/interfaces/ports/{portIdx}/actions",
      path_params_style: :curly, path_params: [siteId: site_id, deviceId: device_id, portIdx: port_idx],
      json: body
    )
  end

  @doc """
  Get latest statistics for an adopted device.
  """
  @spec get_latest_statistics(Req.Request.t(), String.t(), String.t()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def get_latest_statistics(req, site_id, device_id) do
    Req.request(req,
      method: :get,
      url: "/v1/sites/{siteId}/devices/{deviceId}/statistics/latest",
      path_params_style: :curly, path_params: [siteId: site_id, deviceId: device_id]
    )
  end

  @doc """
  List devices pending adoption.
  """
  @spec list_pending(Req.Request.t(), keyword()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def list_pending(req, params \\ []) do
    Req.request(req,
      method: :get,
      url: "/v1/pending-devices",
      params: params
    )
  end
end
