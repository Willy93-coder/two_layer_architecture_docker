FROM ubuntu:24.04 AS clone-stage 

WORKDIR /app

# Install dependencies
RUN apt-get update && apt-get install -y \ 
    git \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Clone odoo project
RUN git clone --depth 1 https://github.com/odoo/odoo.git

FROM ubuntu:24.04 AS dependency-stage

WORKDIR /app

# Install dependencies
RUN apt-get update && apt-get install -y \ 
    inetutils-ping \
    wget \
    postgresql-client \
    python3 \
    python3-pip \
    python3-venv \
    libldap2-dev \
    libpq-dev \
    libsasl2-dev \
    build-essential \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy odoo
COPY --from=clone-stage /app/odoo /app/odoo

# Install python requirements
RUN cd /app/odoo && pip install --break-system-packages -r requirements.txt

# Copy entrypoint script and make it executable
COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

# Port
EXPOSE 8069

# ENTRYPOINT
ENTRYPOINT [ "entrypoint.sh" ]