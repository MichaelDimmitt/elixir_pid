defmodule ElixirPidExamples do
  def filePid(name) do
    # {:ok, file} = File.open("hello", [:write])
#    IO.write(file, "is anybody out there")
    {:ok, file} = File.open(name, [:write])
  end
  def file(name) do
    # {:ok, file} = File.open("hello", [:write])
    {:ok, file} = File.open(name, [:write]) |>
    IO.inspect()
    IO.write(file, "is anybody out there")
  end
end
