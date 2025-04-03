# Financial Tracker Database

This repository contains the database schema, migrations, and configurations for the FinTrack project. It is designed to manage the PostgreSQL database that stores asset data, user information, and transaction history.

## Features

- **Schema Management**: Define and version-control the database schema.
- **Migrations**: Apply incremental changes to the database structure using tools like Flyway or Liquibase.
- **Database Initialization**: Scripts to set up the database for development and production environments.

## Getting Started

### Prerequisites

- **PostgreSQL**: Ensure PostgreSQL is installed and running.
- **psql**: Command-line tool for interacting with PostgreSQL.
- **Flyway** (optional): For managing database migrations.

### Setting Up the Database

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/financial-tracker-db.git
   cd financial-tracker-db

2. Create a PostgreSQL database:

psql -U <username> -c "CREATE DATABASE financial_tracker;"

3. Apply the initial schema:

psql -U <username> -c "CREATE DATABASE financial_tracker;"

4. (Optional) Run migrations using Flyway:

flyway migrate

Local Development with Docker
If you prefer to run the database locally using Docker, use the provided docker-compose.yml file:

1. Start the database:

docker-compose up -d

2. Access the database:

psql -h localhost -U postgres -d financial_tracker

Connecting to the Database
Update your backend's application.properties file with the following configuration:

spring.datasource.url=jdbc:postgresql://<host>:<port>/financial_tracker
spring.datasource.username=<username>
spring.datasource.password=<password>

Contributing
Contributions are welcome! Please open an issue or submit a pull request for any enhancements or bug fixes.

License
This project is licensed under the MIT License. See the LICENSE file for details.

---

### Key Points:
1. **Move `schema.sql`**: Transfer the `schema.sql` file from the backend repository to the [financial-tracker-db](http://_vscodecontentref_/7) repository.
2. **Add Migrations**: Create a `migrations/` folder for version-controlled schema updates.
3. **Optional Docker Support**: Include a `docker-compose.yml` file for local database setup if needed.
4. **Backend Integration**: Ensure the backend repository points to the database managed by this repository.