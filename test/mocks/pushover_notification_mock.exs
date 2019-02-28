defmodule HTTPoison.Response do
  defstruct body: nil, headers: nil, status_code: nil
end

defmodule PushoverNotificationMock do
  def start do
    {}
  end

  def post(_url, _params) do
    {:ok, successful_response()}
  end

  defp successful_response do
    %HTTPoison.Response{
      body: %{"request" => "random-notification-number", "status" => 1},
      headers: [
        {"Server", "nginx"},
        {"Date", "Sun, 24 Feb 2019 21:58:37 GMT"},
        {"Content-Type", "application/json; charset=utf-8"},
        {"Transfer-Encoding", "chunked"},
        {"Connection", "keep-alive"},
        {"X-Frame-Options", "SAMEORIGIN"},
        {"X-XSS-Protection", "1; mode=block"},
        {"X-Content-Type-Options", "nosniff"},
        {"Access-Control-Allow-Origin", "*"},
        {"Access-Control-Allow-Methods", "POST, OPTIONS"},
        {"Access-Control-Allow-Headers",
         "X-Requested-With, X-Prototype-Version, Origin, Accept, Content-Type, X-CSRF-Token, X-Pushover-App, Authorization"},
        {"Access-Control-Max-Age", "1728000"},
        {"X-Limit-App-Limit", "7500"},
        {"X-Limit-App-Remaining", "7483"},
        {"X-Limit-App-Reset", "1551420000"},
        {"ETag", "W/\"737c40ba5cb264edc2a5da920206d568\""},
        {"Cache-Control", "max-age=0, private, must-revalidate"},
        {"X-Request-Id", "652057eb-37f0-4950-9894-ced81f5e97b9"},
        {"X-Runtime", "0.031935"},
        {"X-Frame-Options", "DENY"},
        {"Strict-Transport-Security", "max-age=31536000"}
      ],
      status_code: 200
    }
  end
end
