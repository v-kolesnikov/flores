db:
	psql -h localhost -U postgres

setup:
	mix ecto.create
	psql -h localhost -U postgres < demo_small.sql
