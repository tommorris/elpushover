defmodule Elpushover.Notification do
  @doc """
  Notification is a struct containing optional (and override) options for a
  Pushover notification.

  * `user` — user token, to override `PUSHOVER_USER_TOKEN` environment variable
  * `device` — string containing name of device
  * `title` — message's title (otherwise app name is used)
  * `url` — makes a clickable link in the device's browser, or which invoke
    an application action (e.g. iOS URL Schemes)
  * `url_title` — title for URL
  * `priority`
      * `-2`: generates no notification/alert
      * `-1`: quiet Notification
      * `1`: high priority, bypasses quiet hours
      * `2`: require confirmation
  * `sound` — name of sound, see [list](https://pushover.net/api#sounds)
  * `timestamp` — Unix timestamp.
    If not set, server will set date-time on receipt.
  * `attachment` — the filename of an image to be sent with the notification
  """

  defstruct [:user, :device, :title, :url_title, :url,
    :priority, :sound, :timestamp, :attachment]
end
