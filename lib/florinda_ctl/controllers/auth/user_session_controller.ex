require Logger

defmodule FlorindaCtl.Auth.UserSessionController do
  use FlorindaCtl, :controller

  alias FlorindaCtl.Accounts
  alias FlorindaCtl.Auth.UserAuth
  alias FlorindaCtl.Recaptcha

  def new(conn, _params) do
    render(conn, "new.html", error_message: nil)
  end

  def create(conn, %{"user" => user_params} = params) do
    case Recaptcha.verify(Map.get(params, "g-recaptcha-response"), "sign_in") do
      {:ok, _ } ->
        %{"email" => email, "password" => password} = user_params
        if user = Accounts.get_user_by_email_and_password(email, password) do
          UserAuth.log_in_user(conn, user, user_params)
        else
          render(conn, "new.html", error_message: "Incorrect email or password")
        end
      {:error, _reason} ->
        render(conn, "new.html", error_message: "The reCAPTCHA test failed")
    end
  end

  def delete(conn, _params) do
    conn
    |> put_flash(:info, "Logged out successfully.")
    |> UserAuth.log_out_user()
  end
end
