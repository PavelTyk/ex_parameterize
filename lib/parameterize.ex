defmodule Parameterize do
  @moduledoc """
  Replaces special characters in a string so that it may be used as part of a ‘pretty’ URL.
  Supports any language.

  ## Examples:

      iex> Parameterize.parameterize("Привет, мир!")
      "privet-mir"

  """

  @charmap "lib/charmap.exs" |> Code.eval_file() |> elem(0)
  @alnums Enum.into(?A..?Z, []) ++ Enum.into(?a..?z, []) ++ Enum.into(?0..?9, [])


  @doc """
  Returns parameterized string or nil.

  ## Examples:

      iex> Parameterize.parameterize("Привет, мир!")
      "privet-mir"

      iex> Parameterize.parameterize("ሰላም ልዑል")
      "salaame-leule"

      iex> Parameterize.parameterize("こんにちは")
      "konnitiha"

      iex> Parameterize.parameterize("!-+&")
      nil

  """
  def parameterize(string) when is_binary(string) do
    string
    |> transliterate([])
    |> String.downcase()
    |> String.replace(~r/-+/, "-")
    |> String.replace(~r/^-+|-+$/u, "")
    |> finalize()
  end
  def parameterize(nil), do: nil

  defp finalize(""), do: nil
  defp finalize(string), do: string

  defp to_codepoints(string) do
    string
    |> String.normalize(:nfc)
    |> String.to_charlist()
  end

  defp transliterate(string, acc) when is_binary(string) do
    string
    |> to_codepoints()
    |> transliterate(acc)
  end

  defp transliterate([], acc) do
    acc
    |> Enum.reverse()
    |> Enum.join()
  end

  defp transliterate([codepoint | rest], acc) when codepoint in @alnums do
    transliterate(rest, [<<codepoint>> | acc])
  end

  defp transliterate([0x20 | rest], acc) do
    transliterate(rest, [<<0x2D>> | acc])
  end

  defp transliterate([codepoint | rest], acc) do
    case Map.get(@charmap, codepoint) do
      nil -> transliterate(rest, acc)
      replacement -> transliterate(rest, [replacement | acc])
    end
  end
end
