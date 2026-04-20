from google.cloud import bigquery

# CONFIG
PROJECT_ID = "kestra-sandbox-487804"
DATASET_ID = "flights_dataset"
# TABLE_ID = "fct_flight_delays"
TABLE_ID = "dim_delay_causes"
# GCS_URI = "gs://de-zoomcamp-flightsdelay-data/flights/mart/*.csv"
GCS_URI = "gs://de-zoomcamp-flightsdelay-data/flights/mart/dim_delay_causes_gcp_stage/*.csv"

def main():
    client = bigquery.Client(project=PROJECT_ID)

    table_ref = f"{PROJECT_ID}.{DATASET_ID}.{TABLE_ID}"

    job_config = bigquery.LoadJobConfig(
        source_format=bigquery.SourceFormat.CSV,
        skip_leading_rows=1,
        autodetect=True,
        write_disposition="WRITE_TRUNCATE",

        time_partitioning=bigquery.TimePartitioning(
            field="YEAR"   # or a date field if you have it
        ),

        clustering_fields=["AIRPORT", "CARRIER_NAME"]
    )

    print(f"Loading data into {table_ref}...")

    load_job = client.load_table_from_uri(
        GCS_URI,
        table_ref,
        job_config=job_config,
    )

    load_job.result()  # Wait for job

    print("✅ Load completed!")

if __name__ == "__main__":
    main()