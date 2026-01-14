
# 📦 Supply Chain Analytics Project

**(Python + SQL Server + Power BI)**

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

## 🐍 Python Analysis (Data Cleaning & EDA)

### 🔹 Purpose of Python Stage

Python was used as the **first layer of analysis** to:

* Understand raw data behavior
* Clean and validate the dataset
* Perform exploratory and quantitative analysis
* Prepare structured data for SQL ingestion

---

### 🧹 Data Cleaning (Python)

Key cleaning steps performed:

* Handled missing values
* Ensured correct data types for numeric & categorical fields
* Checked for duplicate records
* Validated ranges for prices, costs, stock, and defect rates

---

### 📊 Exploratory Data Analysis (EDA)

Python EDA focused on:

* Distribution of prices, costs, and stock levels
* Revenue and profit patterns
* Defect rate trends
* Supplier and transportation mode comparisons
---

### 📈 Quantitative Insights (Python)

* Identified early **profitability trends**
* Highlighted **high-defect suppliers**
* Detected **inventory imbalance risks**
* Supported metric definitions later used in SQL & Power BI

> Python acted as the **analytical foundation**, while SQL handled **scalability, constraints, and production-level analysis**.

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


---

## 🔗 End-to-End Workflow

```
CSV Data
   ↓
Python (Cleaning + EDA + Insights)
   ↓
SQL Server (Modeling + Constraints + Analytics)
   ↓
Power BI (Dashboards & KPIs)
```

---

## 🚀 Key Outcomes

* Unified **Python → SQL → Power BI analytics pipeline**
* Strong focus on **business-driven KPIs**
* Production-ready SQL with constraints & calculated metrics
* Portfolio-grade dashboards for stakeholders

---

## 👩‍💻 Author

**Fatima Iman**
Data Analyst | Python • SQL • Power BI • Supply Chain Analytics

📌 *Built as a portfolio project demonstrating real-world analytics workflows.*

---

