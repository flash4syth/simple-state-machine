defmodule SheepTalk do
  def recognize(string) do
    string
    |> String.split("", trim: true)
    |> Enum.reduce({:start, ""}, &_recognize/2)
    |> case(do: ({:end, result} -> result))
  end

  defp _recognize("b", {:start, word}) do
    IO.puts("STATE: start, INPUT: b")
    {:q1, word <> "b"}
  end

  defp _recognize( invalid, {:start, _}) do
    IO.puts("STATE: start, INPUT: #{invalid}")
    {:error, "Failed to talk sheep!"}
  end

  defp _recognize("a", {:q1, word}) do
    IO.puts("STATE: q1, INPUT: a")
    {:q2, word <> "a"}
  end

  defp _recognize(invalid, {:q1, _}) do
    IO.puts("STATE: q1, INPUT: #{invalid}")
    {:error, "Failed to talk sheep!"}
  end

  defp _recognize("a", {:q2, word}) do
    IO.puts("STATE: q2, INPUT: a")
    {:q3, word <> "a"}
  end

  defp _recognize(invalid, {:q2, _}) do
    IO.puts("STATE: q2, INPUT: #{invalid}")
    {:error, "Failed to talk sheep!"}
  end

  defp _recognize("a", {:q3, word}) do
    IO.puts("STATE: q3, INPUT: a")
    {:q3, word <> "a"}
  end

  defp _recognize("!", {:q3, word}) do
    IO.puts("STATE: q3, INPUT: !")
    {:end, word <> "!"}
  end

  defp _recognize(invalid, {:q3, _}) do
    IO.puts("STATE: q3, INPUT: #{invalid}")
    {:error, "Failed to talk sheep!"}
  end

end
