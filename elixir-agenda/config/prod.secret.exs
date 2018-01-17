use Mix.Config

# In this file, we keep production configuration that
# you'll likely want to automate and keep away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or yourself later on).
config :hello, HelloWeb.Endpoint,
  secret_key_base: "4dIw08g61QiIV3lfJS8jJ1G9w4mmN42H5Zbr98AuZ/d0C/LjK2Zz88K+c+RC9EaN"

# Configure your database
config :hello, Hello.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "hello_prod",
  pool_size: 15
