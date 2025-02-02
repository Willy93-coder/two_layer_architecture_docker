#!/bin/bash

set -e

host="$DB_HOST"
port="$DB_PORT"

# Create Odoo configuration file dynamically using environment variables
echo "[options]" > /etc/odoo.conf
echo "admin_passwd = ${ADMIN_DB_PASS}" >> /etc/odoo.conf
echo "db_host = ${DB_HOST}" >> /etc/odoo.conf
echo "db_port = ${DB_PORT}" >> /etc/odoo.conf
echo "db_user = ${USER}" >> /etc/odoo.conf
echo "db_password = ${PASSWORD}" >> /etc/odoo.conf
echo "db_name = ${DB}" >> /etc/odoo.conf


# Function to check PostgreSQL server availability
check_postgres() {
    pg_isready -h "$host" >/dev/null 2>&1
}

# Wait until PostgreSQL server is available
while ! check_postgres; do
    echo "Esperando a que el servidor PostgreSQL esté disponible en $host..."
    sleep 5 
done

# Connect to PostgreSQL using .pgpass file for password
PGPASSFILE="$HOME/.pgpass"
echo "$host:$port:*:$USER:$PASSWORD" > "$PGPASSFILE"
chmod 600 "$PGPASSFILE"

psql -h "$host" -U "$USER" -p "$DB_PORT" -d "$DB"

# Init Odoo
cd /app/odoo && python3 odoo-bin --addons-path=addons -i base -d ${DB} -c /etc/odoo.conf