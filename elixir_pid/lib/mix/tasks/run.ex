defmodule Mix.Tasks.RunTask do
  use Mix.Task

  @shortdoc "Simply calls the Hello.say/0 function."
  def run(_) do
    # calling our Hello.say() function from earlier
    ElixirPid.hello() |>
    IO.inspect()
  end
end
