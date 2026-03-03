defmodule UniFi.Network.Legacy.Stats do
  @moduledoc """
  Statistics endpoints from the legacy controller API.

  These provide much richer data than the official integration API,
  including per-client RF stats, DPI data, rogue APs, events, and alarms.
  """

  @doc """
  Get system information (controller version, uptime, memory, etc.).
  """
  @spec sysinfo(Req.Request.t()) :: {:ok, Req.Response.t()} | {:error, Exception.t()}
  def sysinfo(req) do
    Req.request(req, method: :get, url: "/stat/sysinfo")
  end

  @doc """
  Get health status for all subsystems (wlan, wan, lan, vpn, www).
  """
  @spec health(Req.Request.t()) :: {:ok, Req.Response.t()} | {:error, Exception.t()}
  def health(req) do
    Req.request(req, method: :get, url: "/stat/health")
  end

  @doc """
  Get detailed device statistics (per-port traffic, radio stats, temperatures).

  Returns ~100+ fields per device vs ~15 in the integration API.
  """
  @spec devices(Req.Request.t()) :: {:ok, Req.Response.t()} | {:error, Exception.t()}
  def devices(req) do
    Req.request(req, method: :get, url: "/stat/device")
  end

  @doc """
  Get basic device info (lighter than `devices/0`).
  """
  @spec devices_basic(Req.Request.t()) :: {:ok, Req.Response.t()} | {:error, Exception.t()}
  def devices_basic(req) do
    Req.request(req, method: :get, url: "/stat/device-basic")
  end

  @doc """
  Get detailed client (station) statistics.

  Returns ~91 fields per client including RSSI, signal, channel, radio,
  satisfaction score, roam count, DPI data, and more.
  """
  @spec clients(Req.Request.t()) :: {:ok, Req.Response.t()} | {:error, Exception.t()}
  def clients(req) do
    Req.request(req, method: :get, url: "/stat/sta")
  end

  @doc """
  Get guest client statistics.
  """
  @spec guests(Req.Request.t()) :: {:ok, Req.Response.t()} | {:error, Exception.t()}
  def guests(req) do
    Req.request(req, method: :get, url: "/stat/guest")
  end

  @doc """
  Get detected rogue/neighbor access points.
  """
  @spec rogue_aps(Req.Request.t()) :: {:ok, Req.Response.t()} | {:error, Exception.t()}
  def rogue_aps(req) do
    Req.request(req, method: :get, url: "/stat/rogueap")
  end

  @doc """
  Get system events.
  """
  @spec events(Req.Request.t()) :: {:ok, Req.Response.t()} | {:error, Exception.t()}
  def events(req) do
    Req.request(req, method: :get, url: "/stat/event")
  end

  @doc """
  Get system alarms.
  """
  @spec alarms(Req.Request.t()) :: {:ok, Req.Response.t()} | {:error, Exception.t()}
  def alarms(req) do
    Req.request(req, method: :get, url: "/stat/alarm")
  end

  @doc """
  Get DPI (Deep Packet Inspection) traffic statistics.
  """
  @spec dpi(Req.Request.t()) :: {:ok, Req.Response.t()} | {:error, Exception.t()}
  def dpi(req) do
    Req.request(req, method: :get, url: "/stat/dpi")
  end

  @doc """
  Get current channel usage data.
  """
  @spec current_channels(Req.Request.t()) :: {:ok, Req.Response.t()} | {:error, Exception.t()}
  def current_channels(req) do
    Req.request(req, method: :get, url: "/stat/current-channel")
  end

  @doc """
  Get spectrum scan results.
  """
  @spec spectrum_scan(Req.Request.t()) :: {:ok, Req.Response.t()} | {:error, Exception.t()}
  def spectrum_scan(req) do
    Req.request(req, method: :get, url: "/stat/spectrum-scan")
  end

  @doc """
  Get routing table statistics.
  """
  @spec routing(Req.Request.t()) :: {:ok, Req.Response.t()} | {:error, Exception.t()}
  def routing(req) do
    Req.request(req, method: :get, url: "/stat/routing")
  end

  @doc """
  Get voucher statistics.
  """
  @spec vouchers(Req.Request.t()) :: {:ok, Req.Response.t()} | {:error, Exception.t()}
  def vouchers(req) do
    Req.request(req, method: :get, url: "/stat/voucher")
  end

  @doc """
  Get payment statistics.
  """
  @spec payments(Req.Request.t()) :: {:ok, Req.Response.t()} | {:error, Exception.t()}
  def payments(req) do
    Req.request(req, method: :get, url: "/stat/payment")
  end

  @doc """
  Get authorization statistics.
  """
  @spec authorizations(Req.Request.t()) :: {:ok, Req.Response.t()} | {:error, Exception.t()}
  def authorizations(req) do
    Req.request(req, method: :get, url: "/stat/authorization")
  end
end
