defmodule UniFiTest do
  use ExUnit.Case
  doctest UniFi

  test "greets the world" do
    assert UniFi.hello() == :world
  end
end
