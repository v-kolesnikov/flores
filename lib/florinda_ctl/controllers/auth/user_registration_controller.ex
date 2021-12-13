defmodule FlorindaCtl.Auth.UserRegistrationController do
  use FlorindaCtl, :controller

  alias FlorindaCtl.Accounts
  alias FlorindaCtl.Accounts.User
  alias FlorindaCtl.Auth.UserAuth
  alias FlorindaCtl.Recaptcha

  def new(conn, _params) do
    changeset = Accounts.change_user_registration(%User{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params} = params) do
    case Recaptcha.verify(Map.get(params, "g-recaptcha-response"), "sign_up") do
      {:ok, _ } ->
        case Accounts.register_user(user_params) do
          {:ok, user} ->
            {:ok, _} =
              Accounts.deliver_user_confirmation_instructions(
                user,
                &Routes.auth_user_confirmation_url(conn, :edit, &1)
              )

            conn
            |> put_flash(:info, "User created successfully.")
            |> UserAuth.log_in_user(user)

          {:error, %Ecto.Changeset{} = changeset} ->
            render(conn, "new.html", changeset: changeset)
        end
      {:error, _reason} ->
        changeset = Accounts.change_user_registration(%User{})
        render(conn, "new.html", changeset: changeset)
    end
  end
end
