defmodule UniFi.Network.Sites do
  @moduledoc """
  Manage local sites on the Network controller.
  """

  @doc """
  List local sites on the controller.
  """
  @spec list(Req.Request.t(), keyword()) :: {:ok, Req.Response.t()} | {:error, Exception.t()}
  def list(req, params \\ []) do
    Req.request(req,
      method: :get,
      url: "/v1/sites",
      params: params
    )
  end
end
