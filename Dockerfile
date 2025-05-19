FROM postgres:15

# Install Flyway
RUN apt-get update && \
    apt-get install -y wget && \
    wget -qO- https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/9.16.0/flyway-commandline-9.16.0-linux-x64.tar.gz | tar xvz && \
    mv flyway-9.16.0 /opt/flyway && \
    ln -s /opt/flyway/flyway /usr/local/bin/flyway && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy migrations
COPY migrations /flyway/sql

# Copy and adjust Flyway configuration
COPY flyway.conf /flyway/conf/flyway.conf
RUN sed -i 's|jdbc:postgresql://localhost:5433|jdbc:postgresql://localhost:5432|g' /flyway/conf/flyway.conf && \
    sed -i 's|filesystem:/Users/johnkim1216/VSCodeProjects/fintrack-project/financial-tracker-db/migrations|filesystem:/flyway/sql|g' /flyway/conf/flyway.conf

# Create initialization script
RUN echo '#!/bin/bash\n\
set -e\n\
\n\
# Start PostgreSQL in the background\n\
docker-entrypoint.sh postgres &\n\
\n\
# Wait for PostgreSQL to be ready\n\
until pg_isready -h localhost -p 5432 -U ${POSTGRES_USER}; do\n\
  echo "Waiting for PostgreSQL to be ready..."\n\
  sleep 1\n\
done\n\
\n\
# Update Flyway config with environment variables\n\
sed -i "s/flyway.user=.*/flyway.user=${POSTGRES_USER}/" /flyway/conf/flyway.conf\n\
sed -i "s/flyway.password=.*/flyway.password=${POSTGRES_PASSWORD}/" /flyway/conf/flyway.conf\n\
\n\
# Run Flyway migrations\n\
flyway migrate\n\
\n\
# Keep container running\n\
wait\n\
' > /docker-entrypoint-initdb.d/init.sh && \
    chmod +x /docker-entrypoint-initdb.d/init.sh

# Expose PostgreSQL port
EXPOSE 5432 