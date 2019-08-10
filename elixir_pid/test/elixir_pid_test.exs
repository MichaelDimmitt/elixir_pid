defmodule ElixirPidTest do
  use ExUnit.Case
  doctest ElixirPid

  test "greets the world" do
    assert ElixirPid.hello() == :world
  end
end
