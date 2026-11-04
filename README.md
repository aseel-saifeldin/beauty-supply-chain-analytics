# Beauty Supply Chain Analytics

## 1. Project Overview

This project analyzes a beauty company's supply chain operations using MySQL and Power BI.

The analysis focuses on understanding business performance, managing inventory, evaluating supplier performance, and examining product quality.

The project aims to explore supply chain data and identify useful insights that can support better operational decisions.

## 2. Project Objectives

- Analyze overall supply chain performance.
- Explore inventory levels, product sales, and stock availability.
- Evaluate supplier performance and manufacturing operations.
- Examine product quality and defect rates.
- Identify patterns that can help improve operational efficiency.

## 3. Dataset Overview

The dataset was obtained from Kaggle and contains 100 records covering different aspects of a beauty supply chain.

It includes three product categories:

- Skincare
- Haircare
- Cosmetics

The dataset contains information about:

- Products and sales
- Inventory and stock levels
- Suppliers and procurement
- Manufacturing and production
- Shipping and transportation
- Product inspections and defect rates
- Operational costs

## 4. Tools Used

- **MySQL Workbench:** Data cleaning, SQL queries, and data analysis.
- **Microsoft Power BI:** Data visualization and dashboard development.

## 5. Analysis

The project includes SQL analysis and three Power BI dashboards:

### Dashboard 1: General Overview

Provides an overview of supply chain performance and key business metrics.

### Dashboard 2: Inventory Analysis

Focuses on inventory levels, product availability, stock management, and sales.

### Dashboard 3: Supplier & Quality Analysis

Examines supplier performance, manufacturing operations, inspection results, and product defect rates.

## 6. Key Insights & Recommendations

### A. Sales & Business Performance

**1. Skincare leads in sales.**

Skincare accounts for approximately 44% of total units sold, making it the leading product category.

**Recommendation:** Maintain sufficient inventory to support demand for Skincare products.

**2. Revenue differs across product categories.**

Skincare has the highest average revenue per product type, followed by Cosmetics and Haircare.

**Recommendation:** Review product pricing and revenue performance, particularly for Haircare.

**3. Haircare has more unknown customer information.**

Haircare shows a higher contribution from customers with unknown demographic information.

**Recommendation:** Improve customer data collection to support better customer understanding and marketing decisions.

### B. Inventory & Shipping

**4. Most products have inventory risks.**

Out of 100 products, 28 are High Risk, approximately 54 are Medium Risk, 15 are Low Stock, and only 3 are Normal.

**Recommendation:** Prioritize high-risk products and regularly monitor medium-risk inventory.

**5. High-selling products also appear in the high-risk category.**

Products such as SKU10, SKU94, SKU9, SKU36, SKU11, and SKU40 appear in both lists.

**Recommendation:** Prioritize replenishment planning for these products to reduce potential stock shortages.

**6. Stock levels do not show a clear visual relationship with sales.**

The scatter chart shows considerable variation in stock levels across products.

**Recommendation:** Consider actual sales demand when planning inventory replenishment.

**7. Carrier B has the best shipping performance.**

Carrier B has the lowest average shipping cost (5.51) and the shortest average shipping time (5.30 days).

**Recommendation:** Consider using Carrier B for suitable shipments while monitoring other carriers' performance.

### C. Supplier & Product Quality

**8. Inspection results show quality concerns.**

Only 23% of products passed inspection, while 36% failed and 41% remain pending.

**Recommendation:** Complete pending inspections and investigate failed results.

**9. Supplier 4 requires further review.**

Supplier 4 has approximately 31 total defects among failed items and no recorded passed items.

**Recommendation:** Review Supplier 4's quality performance and investigate possible causes of inspection failures.

**10. Defects are also recorded among passed products.**

Several suppliers show defect values in products classified as Passed.

**Recommendation:** Review inspection criteria and acceptable defect thresholds.

**11. Supplier lead times vary.**

Supplier 3 has the longest average lead time (approximately 20 days), while Supplier 1 has the shortest (approximately 14.8 days).

**Recommendation:** Investigate longer lead times and review opportunities to improve procurement planning.

## 7. Project Files

- `supply_chain_analysis.sql` – SQL queries used for data preparation and analysis.
- `supply_chain_dashboard.pbix` – Power BI file containing the three dashboards.

## 8. Data Source

The dataset was obtained from Kaggle.

**Dataset:** Beauty Supply Chain Analytics (SQL)

## 9. Analysis Limitations

- No business targets or benchmarks are available.
- No monthly or quarterly data is available to analyze trends.
- Profit and profit margin information is not available.
- Supplier defect totals do not provide enough information for a fair defect-rate comparison.
- Pending inspections limit the assessment of overall product quality.
- Some dashboard labels and calculation definitions require further validation.

## 10. Project Status

This project is completed as an initial analysis and is open to further review, improvements, and future enhancements.
