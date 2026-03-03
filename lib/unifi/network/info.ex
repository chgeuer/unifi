defmodule UniFi.Network.Info do
  @moduledoc """
  Get application info from the Network API.
  """

  @doc """
  Get application information.
  """
  @spec get(Req.Request.t()) :: {:ok, Req.Response.t()} | {:error, Exception.t()}
  def get(req) do
    Req.request(req,
      method: :get,
      url: "/v1/info"
    )
  end
end
