# ✈️ Flights Delay Analytics Pipeline (End-to-End Data Engineering Project)

## 📌 Problem Description

Flight delays are a major operational and financial issue for airlines and passengers. The goal of this project is to build an end-to-end data engineering pipeline that processes raw flight delay data, transforms it into analytics-ready datasets, and makes it available for business intelligence and decision-making.

This project answers key questions such as:
- What are the main causes of flight delays?
- Which airlines and airports experience the most delays?
- How do delay patterns vary over time?

The final output is a cloud-based analytics pipeline with automated ingestion, transformation, and reporting layers.

---

## ☁️ Cloud Architecture

This project is fully developed in the cloud using:

- **Snowflake** → Data warehouse (raw + transformed layers)
- **Google Cloud Storage (GCS)** → Data lake storage
- **BigQuery** → Analytics serving layer
- **Kestra** → Workflow orchestration (Infrastructure-as-Code style pipelines)
- **dbt** → Data transformations

All infrastructure and workflows are defined as code using Kestra YAML pipelines.

---

## 🔄 Architecture Diagram
