defmodule FlorindaCtl.Cldr do
  use Cldr,
    default_locale: "en",
    locales: ["en"],
    add_fallback_locales: false,
    gettext: FlorindaCtl.Gettext,
    data_dir: "./priv/cldr",
    otp_app: :florinda,
    providers: [Cldr.Number]
end
