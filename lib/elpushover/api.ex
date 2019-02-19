defmodule Elpushover.Api do
  use HTTPoison.Base

  def process_request_url(url) do
    "https://api.pushover.net" <> url
  end

  def process_response_body(body) do
    body
    |> Jason.decode!
  end
end
