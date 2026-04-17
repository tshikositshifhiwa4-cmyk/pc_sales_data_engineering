<p align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=1E90FF&height=200&section=header&text=PC%20Sales%20Data%20Engineering&fontSize=35&fontColor=ffffff"/>
</p>

> **An end-to-end data engineering project transforming a flat, messy 10,000-row 
PC sales dataset into a clean, queryable star schema data warehouse. Covering 
data cleaning, formatting, quality validation, and automated pipelines, built in 
SQL Server (SSMS) & compatible with Snowflake.**

---
## Tech Stack

### Data Engineering

<p>
  <img src="https://img.shields.io/badge/Snowflake-1E90FF?style=for-the-badge&logo=snowflake&logoColor=white"/>
  <img src="https://img.shields.io/badge/SQL_Server-CC2927?style=for-the-badge&logo=microsoftsqlserver&logoColor=white"/>
</p>

### Data Modeling

<p>
  <img src="https://img.shields.io/badge/Data_Warehouse-4682B4?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/Star_Schema-FFD700?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/draw.io_(Diagrams.net)-F08705?style=for-the-badge&logo=diagramsdotnet&logoColor=white"/>
</p>

### Planning & Design

<p>
  <img src="https://img.shields.io/badge/Mind_Mapping_(Canva)-FF6F61?style=for-the-badge"/>
</p>

### Project Status
<p>
  <img src="https://img.shields.io/badge/Project-Inprogress-brightgreen?style=for-the-badge"/>
</p>

---

## Project Structure

```
pc-sales-data warehouse/
│
├──  creating_databases/
│   └──create_databases.sql
│
├──  raw_files/
│   └──pc_data.csv
│   
├──  planning/
│   └──plan_map.png
│
├──  Data_Architecture/
│   └── star_schema.png
│ 
├──  dimensions/
│   ├── 1.dim_customer.sql
│   ├── 2.dim_employee.sql
│   ├── 3.dim_product.sql
│   ├── 4.dim_store.sql
│   ├── 5.dim_location.sql
│   ├── 6.dim_payment.sql
│   ├── 7.dim_channel.sql
│   ├── 8.dim_priority.sql
│   └── 9.dim_date.sql
│
├──  fact/
│   └── pc_sales_fact.sql
│
├──  validation/
│   ├── joins_testing.sql
│   └── duplicate_testing.sql
│
└── README.md
```
---

##  Architecture Overview

<img width="601" height="675" alt="Star_schema" src="https://github.com/user-attachments/assets/ddf5760a-e665-443c-9580-2b9759a1d635" />

---

##  Dimension Tables

| Table | Primary Key | Column (s) | Notes |
|---|---|---|---|
| `dim_customer` | `customer_id` | `email`, `first_name`, `last_name`, `contact` | Joined on all 4 columns to avoid fan-out |
| `dim_employee` | `employee_id` | `employee_name`, `department` | Joined on all 2 columns to avoid |
| `dim_product` | `product_id` | `pc_make`, `pc_model`, `storage_type`, `storage_capacity`, `ram` | Joined on all 5 columns to avoid fan-out |
| `dim_store` | `store_id` | `shop_name`  `shop_age`| Joined on all 2 columns to avoid fan_out|
| `dim_location` | `location_id` | `continent`, `country_or_state`, `province_or_city`|Joined on all 3 columns to avoid fan_out|
| `dim_payment` | `payment_id` | `payment_method`| |
| `dim_channel` | `channel_id` | `channel`| |
| `dim_priority` | `priority_id` | `priority` | |
| `dim_date` | `date_id` | `purchase_date`, `ship_date` | NULL ship dates coalesced to `9999-12-31` |

---

## Planing and Architecture

### Planning
<p align="left">
  <a href="./planning/plan_map.png">
    <img src="https://img.shields.io/badge/View_Plan_Map-ff1493?style=for-the-badge">
  </a>
</p>

---

### Architecture
<p align="left">
  <a href="./data_architecture/Star_schema.png">
    <img src="https://img.shields.io/badge/View_Star_Schema-4169e1?style=for-the-badge">
  </a>
</p>

---
##  How to Run

**1. Loading raw data**
<p>
  <a href="./raw_files/pc_data.csv">
    <img src="https://img.shields.io/badge/View_Raw_Data-1E90FF?style=for-the-badge">
  </a>
</p>

```sql
-- raw data loaded into the pc.staging database
[pc_staging].[dbo].[pc_data]
```

**2. Creating and loading data in dimension tables** 
<p align="left">
  <a href="./creating_tables/dimension_tables/">
    <img src="https://img.shields.io/badge/View_Dimension_Tables-ff69b4?style=for-the-badge">
  </a>
</p>

```sql
--
1.dim_customer.sql
2.dim_employee.sql
3.dim_product.sql
4.dim_store.sql
5.dim_location.sql
6.dim_payment.sql
7.dim_channel.sql
8.dim_priority.sql
9.dim_date.sql
```

**3. Validating dimension tables are clean**
<p align="left">
  <a href="./validation/duplicate_testing.sql">
    <img src="https://img.shields.io/badge/View_Duplicate_Testing-228b22?style=for-the-badge">
  </a>
</p>

```sql
-- Checking for duplicates on columns
    --duplicate_testing.sql
```

**4. creating and loading the fact table**
<p align="left">
  <a href="./creating_tables/fact_table/">
    <img src="https://img.shields.io/badge/View_Fact_Table-dc143c?style=for-the-badge">
  </a>
</p>

```sql
-- pc_sales_fact.sql
```

**5. Validating row count**
```sql
SELECT COUNT(*) FROM sales_fact;
-- Expected: 10,000
```

---

## Debugging Fan-Out: Lessons Learned

> This project involved significant debugging of a classic star schema fan-out problem, going from 10k source rows to over 500k fact rows before fixes.

### Root Causes Found

| Issue | Outcome | Fix |
|---|---|---|
| `dim_customer` joined on email only | 10k to over 500k rows in fact | Join on all 4 customer columns |
| `dim_date` had NULL `ship_date` | Rows dropped silently | `COALESCE(ship_date, '9999-12-31')` |
| Loose join conditions across dims | Duplicate fact rows | Join on ALL natural key columns |

### Diagnostic Method

The key technique was **incremental join testing**, adding one dimension at a time and checking row counts:
<p align="left">
  <a href="./validation/join_testing.sql">
    <img src="https://img.shields.io/badge/View_Join_Testing-006400?style=for-the-badge">
  </a>
</p>

```sql
-- join_testing.sql
```
---

## Staging Overview
### Staging Layer
<p align="left">
  <a href="./pc_staging_full_query/pc_staging_tables.sql">
    <img src="https://img.shields.io/badge/View_Staging_SQL-ffa500?style=for-the-badge">
  </a>
</p>


---

##  Snowflake vs SQL Server Syntax

| Feature | Snowflake | SQL Server (SSMS) |
|---|---|---|
| Safe date conversion | `TRY_TO_DATE(col)` | `TRY_CAST(col AS DATE)` |
| Auto increment | `INT AUTOINCREMENT` | `INT IDENTITY(1,1)` |
| String type | `STRING` | `VARCHAR(255)` |

---

## Validation Checklist

- [x] All dimension tables have zero duplicate natural keys
- [x] `dimension tables` used `DISTINCT` 
- [x] `dim_date` handles NULL `ship_date` via `COALESCE`
- [x] All fact joins use full natural key combinations
- [x] `sales_fact` row count = 10,000
- [x] Measures cast to `DECIMAL(10,2)`
- [x] Output validated in Excel

---

## Future Improvements

```mermaid id="h3k9dn"
gantt
    dateFormat  YYYY-MM-DD

    section Data Preparation
    Data Cleaning           :a1, 2026-04-14, 3d
    Data Formatting         :a2, after a1, 3d

    section Data Quality
    Validation Rules        :a3, after a2, 3d

    section Pipeline Development
    Automation              :a4, after a3, 3d
    Logging & Monitoring    :a5, after a4, 2d

    section Optimisation
    Performance Tuning      :a6, after a5, 2d
```
---

<div align="center">

**Built with patience, SQL, and a lot of row count checks** 

</div>

---

<div align="center">
  
[Acknowledgement](https://acknowledgments.netlify.app)

</div>
