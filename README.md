
# 📦 Supply Chain Analytics Project

**(SQL Server + Power BI)**

---

## 📌 Project Overview

This project is an **end-to-end supply chain analytics solution** built using **Python for data preprocessing & exploratory analysis**, **SQL Server for data modeling, validation, and advanced analytics**, and **Power BI for visualization and reporting**.

The project focuses on:

* Revenue & profitability analysis
* Inventory & stock-out risk assessment
* Supplier & manufacturing performance
* Logistics efficiency & transportation cost analysis
* Quality control & defect monitoring

---

## 🛠️ Tech Stack

* **Python**: Pandas, NumPy, Matplotlib/Seaborn (EDA & preprocessing)
* **Database**: Microsoft SQL Server
* **Query Language**: T-SQL
* **Visualization**: Power BI
* **Data Source**: CSV (`supply_chain_data.csv`)


---

### 🧹 Data Cleaning (Python)

Key cleaning steps performed:

* Handled missing values
* Ensured correct data types for numeric & categorical fields
* Checked for duplicate records
* Validated ranges for prices, costs, stock, and defect rates

---

## 🧱 Database Design (SQL Server)

### 📄 Database & Table Creation

* Created `Supply_Chain` database
* Designed a **single fact-style table** to support analytics

---

## 📥 Data Ingestion

Data imported from CSV using `BULK INSERT` for performance and scalability.

---

## 🔄 SQL Data Transformation

### ✏️ Column Standardization

* Renamed columns for clarity and consistency
* Unified naming conventions across Python, SQL, and Power BI

### 🔢 Data Type Optimization

* Converted monetary fields from `FLOAT` → `DECIMAL`
* Improved precision and reporting accuracy

---

## 🧮 Derived Metrics (SQL)

### 💰 Financial Metrics

* **Profit**
* **Warehousing Cost**
* **Total Cost Validation**

### ⚠️ Risk & Quality Metrics

* **Stock-out Risk Index**
* **Defective Units**
* **Accepted Units**

---

## 🔍 Data Quality & Validation

* Null checks across all critical columns
* Duplicate detection using `ROW_NUMBER()`
* Min / Max value analysis for cost, stock, and defect rates

---

## 📊 Business Analysis (SQL)

### 💵 Financial Performance

* Top 5 most profitable SKUs
* Revenue by product category
* Cost structure breakdown

---

### 🚚 Logistics & Transportation

* Average shipping time by carrier
* Cost comparison across transportation modes
* Route efficiency analysis

---

### 🏭 Manufacturing & Supplier Insights

* Manufacturing lead time vs production volume
* Defect rate vs supplier lead time
* Supplier stock-out risk assessment


---

## 📈 Power BI Dashboard

The Power BI dashboard presents:

* Executive KPI overview
* Profitability & cost analysis
* Logistics & supplier performance
* Manufacturing efficiency
* Risk & quality indicators

📸 **Power BI Overview**


<img width="1584" height="829" alt="Screenshot 2026-01-14 190603" src="https://github.com/user-attachments/assets/65755b17-5fb6-45b9-a9af-e65fbb066ca5" />

---

<img width="1536" height="815" alt="Screenshot 2026-01-15 024934" src="https://github.com/user-attachments/assets/473fdd2c-b755-4d63-af49-97d3efe6ef27" />

---

<img width="1536" height="818" alt="Screenshot 2026-01-15 025019" src="https://github.com/user-attachments/assets/7d3e4d87-42bc-44f0-84a5-52853580137e" />

---

<img width="1545" height="816" alt="Screenshot 2026-01-15 025057" src="https://github.com/user-attachments/assets/470e6cb0-6585-4f92-9dd7-37461846f475" />

---

<img width="1539" height="818" alt="Screenshot 2026-01-15 025135" src="https://github.com/user-attachments/assets/ee0aef18-99c8-4feb-b110-72ebbd36050f" />

---

<img width="1544" height="810" alt="Screenshot 2026-01-15 025154" src="https://github.com/user-attachments/assets/a58057b2-cca7-447c-ad2e-366881500b26" />

---

## 🔗 End-to-End Workflow

```
CSV Data
   ↓
SQL Server (Modeling + Constraints + Analytics)
   ↓
Power BI (Dashboards & KPIs)
```

---

## 🚀 Key Outcomes

* Unified **SQL → Power BI analytics pipeline**
* Strong focus on **business-driven KPIs**
* Production-ready SQL with constraints & calculated metrics
* Portfolio-grade dashboards for stakeholders

---

## 👩‍💻 Author

**Fatima Iman**
Data Analyst | • SQL • Power BI • Supply Chain Analytics

📌 *Built as a portfolio project demonstrating real-world analytics workflows.*

---

