# !/bin/bash

export_to_bashrc() {
    # Parameters
    local env_variable="$1"
    local lower_env_variable=$(echo "$env_variable" | tr '[:upper:]' '[:lower:]')
    local file_path="$HOME/.bashrc"

    # Check if the export statement already exists in the file
    if grep -q "export $env_variable=" "$file_path"; then
        # If it exists, remove the line
        sed -i "/export $env_variable=/d" "$file_path"
        echo "Removed existing export statement for $env_variable from $file_path"
    fi

    # Check if the variable contains "password" in any case
    if [[ $lower_env_variable == *"password"* ]]; then
        # If it contains "password", use -s option with read
        read -s -p "Enter the value for $env_variable: " value
    else
        # Otherwise, regular read without -s
        read -p "Enter the value for $env_variable: " value
    fi

    # Append the export statement with the provided value to the file
    echo "export $env_variable=\"$value\"" >> "$file_path"
}

export_to_bashrc "DBT_SF_ACCOUNT"

export_to_bashrc "DBT_SF_USER"

export_to_bashrc "DBT_SF_KEY_PATH"

export_to_bashrc "DBT_SF_ROLE"

export_to_bashrc "DBT_SF_DATABASE"

export_to_bashrc "DBT_SF_WAREHOUSE"

export_to_bashrc "DBT_SF_SCHEMA"

echo "export DBT_PROFILES_DIR=\"/home/vscode/.dbt\"" >> "$HOME/.bashrc"

echo 'export GOOGLE_APPLICATION_CREDENTIALS="/workspaces/DE_Zoomcamp_FlightsDelay/keys/gcp-key.json"' >> "$HOME/.bashrc"