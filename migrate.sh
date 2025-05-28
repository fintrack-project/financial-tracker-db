#!/bin/bash

# Default environment
ENV=${1:-local}

# Function to load environment variables
load_env() {
    local env_file=".env.${ENV}"
    if [ -f "$env_file" ]; then
        echo "Loading environment variables from $env_file"
        export $(cat "$env_file" | grep -v '^#' | xargs)
    else
        echo "Error: $env_file not found"
        exit 1
    fi
}

# Function to validate required environment variables
validate_env() {
    local required_vars=("DATABASE_INTERNAL_PORT" "DATABASE_NAME" "POSTGRES_USER" "POSTGRES_PASSWORD")
    local missing_vars=()

    for var in "${required_vars[@]}"; do
        if [ -z "${!var}" ]; then
            missing_vars+=("$var")
        fi
    done

    if [ ${#missing_vars[@]} -ne 0 ]; then
        echo "Error: Missing required environment variables:"
        printf '%s\n' "${missing_vars[@]}"
        exit 1
    fi
}

# Function to run migration
run_migration() {
    echo "Running Flyway migration for $ENV environment..."
    flyway -configFiles=flyway.conf migrate
}

# Main execution
echo "Starting migration process for $ENV environment..."

# Load environment variables
load_env

# Validate environment variables
validate_env

# Run migration
run_migration 