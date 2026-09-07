## E-Commerce Sales Analysis



**Project Overview:**



This project analyzes e-commerce sales data to identify sales trends, product performance, customer contribution, regional performance, and profitability.



The project follows an end-to-end data analytics workflow using Excel, PostgreSQL, Power BI, and GitHub.



&#x20;**Business Objectives:**



\- Understand overall sales and profit performance

\- Analyze monthly sales trends

\- Identify top-performing products

\- Analyze category-wise sales and profit

\- Compare regional sales performance

\- Identify top customers by sales

\- Identify products with lower profit margins



&#x20;**Tools \& Technologies:**



\- Excel — Data preparation

\- PostgreSQL — Data storage, validation, and SQL analysis

\- Power BI — Dashboard development and visualization

\- GitHub — Project documentation and version control



&#x20;**Project Workflow:**



Excel → PostgreSQL → Data Quality Checks → SQL Analysis → Power BI → Business Insights



&#x20;**Dataset:**



The dataset contains 1,000 e-commerce orders recorded during 2025.



For detailed field definitions, see the \[Data Dictionary](docs/data\_dictionary.md).



&#x20;**Data Quality Checks:**



The dataset was validated in PostgreSQL for:



\- Missing values

\- Duplicate Order IDs

\- Invalid quantities

\- Invalid sales values

\- Invalid discounts

\- Profit values greater than sales



No data quality issues were identified during validation.



&#x20;**SQL Analysis:**



The analysis includes:



\- Overall business KPIs

\- Sales by product

\- Sales by category

\- Sales by region

\- Monthly sales trends

\- Profit by category

\- Top 10 customers by sales

\- Sales vs. profit by product

\- Product-level profit margins

\- Low-margin product identification



&#x20;**Power BI Dashboard:**



!\[E-Commerce Sales \& Profit Dashboard](screenshots/dashboard.png)



The dashboard provides an interactive view of sales, profit, products, categories, customers, and regional performance.



&#x20;**Key Performance Indicators:**



&#x20;KPI  Value



\- Total Sales - 473,040.84 

\- Total Profit - 100,653.17 

\- Total Orders - 1,000 

\- Total Customers - 245 

\- Total Quantity Sold - 3,034 

\- Profit Margin - 21.28% 



&#x20;**Key Business Insights:**



\- Laptop generated the highest sales at 88,636.58.

\- Smartphone generated the second-highest sales at 81,386.84.

\- Electronics generated the highest profit at 64,168.08.

\- Monitor recorded the lowest identified product-level profit margin at approximately 19.77%.

\- Overall profit margin was 21.28%.



**Business Recommendations:**



\- Prioritize high-performing products such as Laptops and Smartphones.

\- Review pricing, discounts, and costs for lower-margin products such as Monitors.

\- Focus on category-level profitability when making business decisions.

\- Use customer-level analysis to identify high-value customers.

\- Monitor regional performance to identify growth opportunities.



&#x20;**Project Structure:**



text

ecommerce-sales-analysis/

│

├── README.md

├── data/

│   └── ecommerce\_sales.csv

├── sql/

│   └── ecommerce\_analysis.sql

├── powerbi/

│   └── ecommerce\_dashboard.pbix

├── screenshots/

│   └── dashboard.png

└── docs/

&#x20;   └── data\_dictionary.md



**Conclusion:**



This project demonstrates an end-to-end data analytics workflow, from data preparation and validation to SQL analysis and Power BI dashboard development.



The analysis provides business insights into sales, profitability, products, customers, categories, and regions.



**Author:**



Aryan



**Data Analytics Portfolio Project**

