defmodule Mix.Tasks.RunTask do
  use Mix.Task
  @shortdoc "calls ElixirPidExamples.filePid/1 and ElixirPidExamples.filePid/1 functions."
  def run(_) do
    ElixirPidExamples.filePid('hello') |> IO.inspect()
    ElixirPidExamples.file('hello') |> IO.inspect()
    from_the_docs()
    # future plan: use self() for everything.
    # 1) instead of variables maintain state by sending to self using send and recieve
    # 2) use processes other to represent individual variables.
    # 3) optional: write a function to learn all modules that have been included into a process.
    # 4) spawn, spawn_link, task, agent, genserver ... only concern yourself with extending the main process self().
  end

  @shortdoc "implementation of process examples from https://elixir-lang.org/getting-started/processes.html"
  def from_the_docs() do
    pid = spawn fn -> 1 + 2 end
    pid |> IO.inspect()
    Process.alive?(pid) |> IO.inspect()
    self() |> IO.inspect()
    Process.alive?(self()) |> IO.inspect()
    send self(), {:hello, "world"} |> IO.inspect()

    receive do
      {:hello, msg}  -> msg
      {:world, _msg} -> "won't match"
    after
      1_000 -> "nothing after 1s"
    end |> IO.inspect()

    parent = self() |> IO.inspect()
    spawn fn -> send(parent, {:hello, self()}) end |> IO.inspect()

    receive do
      {:hello, pid} -> "Got hello from #{inspect pid}"
    end |> IO.inspect()

    send self(), :hello |> IO.inspect()
  end
end

