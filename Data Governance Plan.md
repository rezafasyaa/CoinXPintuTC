-- Objectives --

Ensuring:
1. Completeness: Expected all data is present, checking for missing records or mandatory fields.
2. Accuracy: Measures the data correctly reflects the real-world object or event it describes.
3. Consistency: Ensures the data are same across different systems and datasets, without conflicting.
4. Validity: Ensures the data conforms to a defined format, rules or constraints, and is in the correct structure.
5. Uniqueness: Ensures the data record is not a duplicate and appears once in dataset.
6. Integrity: Evaluates data availability and enough for its intended use.

-- By Doing --
1. Early Detection System (Detect anomalies, duplicate records, suspicious records)
2. Clear Data Ownership
3. Clear Escalation Mechanisms

-- Roles & Responsibilities --

Data Engineer
1. Own data pipelines and ETL/ELT process
2. Maintain SLAs for database update
3. Investigate any pipeline failures and create postmortem for major incidents
4. Manage database schemas, updates, review and commit approval
5. Maintain log/documentation for any changes related to data pipelines, databases schemas, and databases systems


Data Analyst/Business Intelligence
1. Own metric logic and definitions (e.g. active users, users retention, product usage, trading volume)
2. Own core data models (fact table, dimension table, mart table)
3. Set and maintain PK/FK definitions
4. Develop and maintain dashboards
5. Maintain log/documentation for any changes related to owned metric, data models, and dashboards

-- Updates & Changes Version Control --

All updates and changes follow:
1. Develop updates and/or changes on personal branch
2. Update the Log/Docs
3. GitHub pull request to main branch
4. Peer review by Data Analyst/Business Intelligence team 
5. Higher review by Data Engineer team
6. Reverse compatible releases
7. Release

-- Monitoring --

1. Track job run success/failure
2. Track last_update_timestamp for each table
3. Check data volume (current record count vs. historical record count)

Alerts sent to Slack/email if:
1. Pipelines fail
2. Job stale beyond SLA
3. Sudden drop/spike
