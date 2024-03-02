create-network:
	docker network create -d bridge my-odoo-network

rm-network:
	docker network rm my-odoo-network

build-odoo:
	cd odoo && \
	docker build -t odoo:0.1 . && \
	cd ..

build-db:
	cd postgres-db && \
	docker build -t postgres-db:0.1 . && \
	cd ..

run-db:
	docker run -d --network my-odoo-network --name postgres-db-run -v postgres-volume:/var/run/postgresql postgres-db:0.1

run-odoo:
	docker run -d --network my-odoo-network -p 8069:8069 --name odoo-app-run odoo:0.1

check-connection:
	docker run --rm --network my-odoo-network odoo:0.1 ping postgres-db:0.1

extract:
	docker cp 5f1460d7925a:/etc/postgresql/16/main/postgresql.conf /Users/willy/Desktop/DAM/sistemas_gestion/arquitectura_dos_capas_odoo/postgres-db/postgresql.conf