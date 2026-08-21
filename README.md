# 📊 E-Commerce Analytics

An end-to-end data analytics project using the Brazilian E-Commerce public dataset (Olist). This repository covers data exploration, relational data modeling, custom DAX measures, and an executive-grade Power BI dashboard.

---

## 📸 Executive Dashboard Preview

![Full Dashboard Preview](Dashboards/Screenshots/full_dashboard.png)

---

## 🎯 Executive Summary & Insights

- **Total Revenue:** R$ 16.00M generated across 99.44K orders with an Average Order Value (AOV) of R$ 160.80.
- **Geographic Distribution:** Revenue is heavily concentrated in São Paulo (**SP**), followed by Rio de Janeiro (**RJ**) and Minas Gerais (**MG**).
- **Payment Preferences:** Credit Cards dominate customer transaction share, followed by _Boleto Bancário_, Vouchers, and Debit Cards.

---

## 🛠️ Data Architecture & Star Schema

The raw relational data (`customers`, `orders`, `order_items`, `order_payments`) was restructured into a clean star schema centered around a custom DAX Date Dimension table:

### Key Technical Implementations

- **Date Hierarchy Handling:** Standardized date formats between `Dim_Date[Date]` and `orders[order_purchase_timestamp]`.
- **Chronological Sorting:** Engineered a numeric `YearMonthSort` column `(YEAR([Date]) * 100 + MONTH([Date]))` to fix chart scrambling in time-series area visuals.

---

## 📐 Core DAX Measures

```dax
// Total Revenue
Total Revenue = SUM('order_payments'[payment_value])

// Total Orders
Total Orders = COUNT('orders'[order_id])

// Average Order Value (AOV)
Average Order Value (AOV) = DIVIDE([Total Revenue], [Total Orders], 0)

// Total Unique Customers
Total Customers = DISTINCTCOUNT('customers'[customer_unique_id])
```
