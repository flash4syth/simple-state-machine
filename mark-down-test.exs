ExUnit.start()

defmodule MarkDownTest do

  defmodule Spec do
    def file, do: "test/spec.txt"
  end

  if File.exists?(Spec.file) do

    use ExUnit.Case
    IO.puts "It works!"

  else
    IO.puts "Skipping spec tests, no spec file!"
  end
end
