defmodule Mix.Tasks.RunTask do
  use Mix.Task
  @shortdoc "Simply calls ElixirPidExamples.filePid/1 and ElixirPidExamples.filePid/1 functions."
  def run(_) do
    ElixirPidExamples.filePid('hello') |> IO.inspect()
    ElixirPidExamples.file('hello') |> IO.inspect()
  end
end
