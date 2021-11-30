db:
	exec psql -h localhost -U postgres

console:
	exec iex -S mix

setup:
	mix ecto.create
	psql -h localhost -U postgres < demo_small.sql
