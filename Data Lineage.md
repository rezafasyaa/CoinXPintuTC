In this repo, end-to-end data lineage follows a 4-layer architecture.

SOURCE PLATFORM -> RAW -> STAGING -> WAREHOUSE -> MART -> DASHBOARD

1. Raw Layer
   Data ingested raw from source platfrom without any transformations applied. These contain exactly same original events as received from the platform.
   
2. Staging Layer:
   Each raw table is cleaned, typecast, and normalized.
   Transformations in staging:
    a. Cast fields accordingly
    b. Apply type consistency across all datasets
    e. Convert timestamp strings to UTC timestamps
   
3. Warehouse Layer:
   This layer forms the core fact warehouse schema. Differentiate between fact and dimension tables.
   Transformations in Warehouse:
    a. Remove duplicate and invalid records
    b. Standardize column names
   
4. Mart Layer:
   This layer built to answer stakeholders questions. Lightweight models optimized for dashboards.

Dashboard Layer
Final layer that consume mart tables for resilience and stability performance. Built for specific metric.
