# 🏭 Supply Chain Analytics — SQL Project

> A comprehensive SQL-based analytics system covering **revenue analysis, inventory health, stockout risk, ABC classification, customer segmentation (RFM), and warehouse performance** — built on a simulated Indian retail supply chain dataset.

---

## 🚀 Project Overview

Supply chain inefficiencies silently drain business revenue. This project builds an end-to-end SQL analytics layer to answer critical business questions:

- Which products are at risk of stockout — and how much revenue could be lost?
- Who are our most valuable customers?
- Which warehouses are underperforming by region?
- Which products deserve priority inventory investment (ABC Analysis)?

---

## 🛠️ Tech Stack

- **Database:** Microsoft SQL Server (T-SQL)
- **Skills:** Joins, CTEs, Window Functions, CASE logic, Aggregations, Subqueries
- **Dataset:** Custom simulated supply chain dataset (Indian retail context)

---

## 📁 Repository Structure

```
📦 supply-chain-sql-analytics/
│
├── 📁 SQL/
│   ├── 📄 00_TableInfo.sql               # Schema overview — all 6 tables
│   ├── 📄 01_revenue_analysis.sql        # Revenue trends, top products & sales insights
│   ├── 📄 02_inventory_analysis.sql      # Inventory value, demand ranking & category analysis
│   ├── 📄 03_stockout_risk.sql           # Stockout risk classification & reorder alerts
│   ├── 📄 04_abc_analysis.sql            # ABC classification based on revenue contribution
│   ├── 📄 05_rfm_analysis.sql            # Customer segmentation using RFM model
│   ├── 📄 06_warehouse_performance.sql   # Warehouse & regional performance evaluation
│   └── 📄 07_potential_lost_revenue.sql  # Estimated revenue impact from stock shortages
│
├── 📁 Datasets/
│   ├── 📊 customers.csv
│   ├── 📊 orders.csv
│   ├── 📊 order_details.csv
│   ├── 📊 products.csv
│   ├── 📊 stocks.csv
│   └── 📊 warehouses.csv
│
└── 📄 README.md
```

---

## 🗃️ Dataset Overview

| Table | Records | Description |
|---|---|---|
| customers | 25 | Customer profiles across 4 regions (North, South, East, West) |
| products | 25 | Products across Electronics, Furniture, Stationery |
| orders | 30 | Order headers with date, customer, and warehouse |
| order_details | 59 | Line-level quantity and unit price per order |
| stocks | 25 | Current stock quantity and reorder level per product |
| warehouses | 6 | Warehouse locations across 4 Indian regions |

---

## 📊 Analysis Modules

### 1. 💰 Revenue Analysis (`01_revenue_analysis.sql`)
- Total revenue across all orders (~₹9.7 Lakh)
- Monthly revenue trend to identify seasonal peaks
- Top 5 products by revenue contribution

### 2. 📦 Inventory Analysis (`02_inventory_analysis.sql`)
- Inventory value per product (stock × price)
- Most ordered vs. low-demand product identification
- Category-level performance ranked by revenue using `ROW_NUMBER()`

### 3. ⚠️ Stockout Risk (`03_stockout_risk.sql`)
- Demand-based stockout risk classification: **High / Medium / Low**
- 9 products identified below reorder level — flagged for immediate restocking
- Reorder alert: compares live stock against reorder threshold

### 4. 🔤 ABC Analysis (`04_abc_analysis.sql`)
- Classifies products into **A (top 80% revenue), B (80–95%), C (bottom 5%)**
- Uses **running total window function** over cumulative revenue percentage
- Helps prioritize inventory investment in high-value SKUs

### 5. 👥 Customer Segmentation — RFM (`05_rfm_Analysis.sql`)
- Segments customers into **HIGH / MEDIUM / LOW** value tiers
- Based on Recency (last order date), Frequency (order count), and Monetary (total spend)
- Built using CTEs with multi-condition CASE logic

### 6. 🏭 Warehouse Performance (`06_warehouse_performance.sql`)
- Ranks warehouses by order volume fulfilled
- Regional breakdown to spot underperforming distribution zones

### 7. 📉 Potential Lost Revenue (`07_potential_lost_revenue.sql`)
- Calculates revenue loss when demand exceeds available stock
- Formula: `(Total Demand − Stock Quantity) × Unit Price`
- Directly quantifies the business cost of poor inventory management

---

## 🔑 Key SQL Concepts Used

| Concept | Where Used |
|---|---|
| CTEs (`WITH`) | ABC Analysis, RFM, Lost Revenue |
| Window Functions (`SUM OVER`, `ROW_NUMBER`) | ABC Analysis, Category Ranking |
| Multi-table JOINs | All modules |
| CASE WHEN | Stockout risk, RFM segmentation, Stock status |
| HAVING clause | Inventory demand filtering |
| OFFSET / FETCH | Top-N product queries |

---

## ⚙️ How to Run

1. Import all `.csv` files into SQL Server as tables
2. Run `00_TableInfo.sql` to verify schema
3. Execute scripts `01` through `07` in order

---

## 💡 Business Insights

| Finding | Business Action |
|---|---|
| 9 products below reorder level | Trigger immediate purchase orders |
| Class A products identified | Prioritize safety stock for top revenue drivers |
| HIGH-value customers segmented | Target for loyalty programs and priority support |
| Regional warehouse gaps visible | Reallocate stock or expand capacity in low-coverage zones |
| Potential revenue loss quantified | Justify inventory investment with hard numbers |

---

## 🙋 Author

**Girish Kumar**
📧 girish1999k.gk@gmail.com
🔗 https://www.linkedin.com/in/girishhkumar/

---

## 📄 License

Open-source under the [MIT License](LICENSE).

---

*If this project helped you, drop a ⭐!*
