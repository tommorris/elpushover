defmodule Elpushover.Api do
  use HTTPoison.Base

  def process_request_url(url) do
    "https://api.pushover.net" <> url
  end

  def process_response(resp) do
    case resp.request_url do
      "https://api.pushover.net/1/messages.json" ->
        process_resp(resp, Elpushover.NotificationResponse)
      _ -> process_generic_resp(resp)
    end
  end

  defp process_resp(resp) do
    Map.update!(resp, :body, fn (body) -> parse_body(body) end)
  end

  defp process_resp(resp, struct_name) do
    Map.update!(resp, :body, fn (body) -> handle_body(body, struct_name) end)
  end

  def handle_body(body, struct_name) do
    struct(struct_name, parse_body(body))
  end

  def parse_body(body) do
    body |> Jason.decode! |> atomise_map_keys
  end

  defp atomise_map_keys(data) do
    Map.new(data, fn {k, v} -> {String.to_atom(k), v} end)
  end
end
