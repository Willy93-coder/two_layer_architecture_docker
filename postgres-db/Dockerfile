FROM ubuntu:22.04

# Set environment variables
ARG USER_DB
ARG PASSWORD
ARG MOD

ENV DEBIAN_FRONTEND ${MOD?notsetmod}
ENV USER ${USER_DB?secretkeynotset}
ENV PASSWORD ${PASSWORD}

# Install packages
RUN apt-get update && apt-get install -y \ 
    postgresql \
    postgresql-client
  
RUN apt install -y inetutils-ping

# Adjust PostgreSQL configurations
RUN echo "host all all 0.0.0.0/0 md5" >> /etc/postgresql/14/main/pg_hba.conf \
    && echo "listen_addresses='*'" >> /etc/postgresql/14/main/postgresql.conf

# Create the user and the database
USER postgres
RUN service postgresql start && \
    sleep 10 && \
    psql -c "CREATE USER "${USER}" WITH PASSWORD '${PASSWORD}';" && \
    createdb $USER

# Port
EXPOSE 5432

# CMD
CMD service postgresql restart && tail -f /dev/null