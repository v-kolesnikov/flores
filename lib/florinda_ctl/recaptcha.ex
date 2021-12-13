defmodule FlorindaCtl.Recaptcha do
  @doc """
  https://developers.google.com/recaptcha/docs/verify#api_request
  """
  def verify(response, action) do
    cond do
      Application.get_env(:florinda, :ctl_recaptcha_enabled) ->
        query = %{
          secret: Application.fetch_env!(:florinda, :ctl_recaptcha_secret_key),
          response: response
        } |> URI.encode_query
        url =
          "https://www.google.com/recaptcha/api/siteverify"
          |> URI.parse()
          |> Map.put(:query, query)
          |> URI.to_string()
        case HTTPoison.post(url, []) do
          {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
            case Jason.decode!(body) do
              %{"success" => true, "action" => ^action } ->
                {:ok, body}
              %{"success" => true } ->
                {:error, :action_mistmatch}
              _ ->
                {:error, :failed}
            end
          {:error, %HTTPoison.Error{reason: reason}} ->
            {:error, reason}
        end
      true ->
        {:ok, []}
    end
  end
end
