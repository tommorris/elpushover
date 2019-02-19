defmodule Elpushover do
  @moduledoc """
  elpushover provides programmatic access to the Pushover API.

  Application's API key is set in `PUSHOVER_API_KEY` environment variable.
  """

  @doc """
  Sends a notification to Pushover. Set `msg` to be the text of the
  notification. `opts` contains any extra commands. User token is token
  from `PUSHOVER_USER_TOKEN` environment variable. This can be overridden by
  setting `user` key in `opts` (example below).

  ## Examples

      iex> Elpushover.notify("Oi you!")
      {:ok, %HTTPoison.Response{...}}

      iex> Elpushover.notify("Message only for my iPad",
        %{device: "iPad"}
      )
      {:ok, %HTTPoison.Response{...}}

      iex> Elpushover.notify("Message",
        %{user: "1234567890abcdef"}
      )
      {:ok, %HTTPoison.Response{...}}
  """
  @spec notify(String.t(), Elpushover.Notification | none()) :: {atom, HTTPoison.Response}
  def notify(msg, opts \\ %{}) do
    user_env = Application.get_env(:elpushover, :user_token)
    user_token = Map.get(opts, :user, user_env)

    default = [
      {:token, Application.get_env(:elpushover, :api_key)},
      {:user, user_token},
      {:message, msg}
    ]

    args = (default ++ Map.to_list(opts))
    {popped, contents} = Keyword.pop(args, :attachment)

    body = case popped do
      nil -> {:form, contents}
      fname -> prepare_multipart_notification(fname, contents)
    end

    Elpushover.Api.start()
    Elpushover.Api.post("/1/messages.json", body)
  end

  #def validate(token, device \\ nil) do
  #end

  defp prepare_multipart_notification(fname, contents) do
    args = ((for {key, val} <- contents,
      into: %{}, do: {Atom.to_string(key), val})
      |> Map.to_list)
    file_block = {:file,
      fname,
      {"form-data", [
        {"name", "attachment"},
        {"filename", Path.basename(fname)}
      ]}, []}

      output = {:multipart, args ++ [file_block]}
      output
  end
end
