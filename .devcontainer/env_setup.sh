# !/bin/bash

#
# Install Python Dependencies
# 

echo "---------------------------- Install Python Requirements ----------------------------"
# Creating new pytho environment with venv
python3 -m venv .data_eng_env
# Activating the environment
source .data_eng_env/bin/activate
# Installing python dependencies within the new environment created
pip3 install -r requirements.txt

#
# DBT Setups
#
echo "---------------------------- DBT Setups ----------------------------"
echo "Creating dbt HOME directory"
mkdir $HOME/.dbt
# Copying profile template to user directory
cp .devcontainer/samples/profiles.yml $HOME/.dbt/profiles.yml

# Allow passing the DBT project directory as an argument (defaults to ./qsi_dbt if not provided)
DBT_PROJECT_DIR=${1:-"./models_dbt"}
# Install DBT dependencies in the specified project directory
dbt deps --project-dir "$DBT_PROJECT_DIR"
