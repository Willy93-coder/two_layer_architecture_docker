FROM ubuntu:22.04

RUN apt-get update && apt-get -y install git
RUN git clone https://github.com/odoo/odoo.git
RUN apt install wget -y
RUN apt-get update && apt-get install postgresql-client -y
RUN apt install -y python3
RUN apt install -y python3-pip
RUN apt install -y python3-pip libldap2-dev libpq-dev libsasl2-dev
RUN cd /odoo && pip install -r requirements.txt
RUN apt install -y inetutils-ping

# Copy entrypoint script and make it executable
COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

# Port
EXPOSE 8069

# ENTRYPOINT
ENTRYPOINT [ "entrypoint.sh" ]