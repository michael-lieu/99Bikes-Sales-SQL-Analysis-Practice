# SQL - Sales Analysis of 99Bikes 

## Overview
This is a practice SQL project in which I analyse the sales and products of a bike merchant. The dataset can be found at: https://www.kaggle.com/datasets/tforsyth/99bikes-sales-data

## Entity Relationship Diagram

![ERD](/images/99bikes_erd.png)

## Business Questions
1. **Business performance:** How has the business performed in the last year?
2. **Cohort analysis:** How do different customer groups generate revenue?
3. **Product analysis:** Which products/brands/product lines have performed well?

To see the SQL queries used to dive into the data and extract insights, click [here](/99bikes_analysis.sql)

## Analysis findings


### Revenue
- Revenue has remained stable on a monthly basis throughout the year.
- However, newer customers and cohorts are gradually spending less compared to the initial cohorts.
- Volume of orders doesnt not fluctuate much throughout the year.
### Cohorts
- Average age of customers range between 40-50.
- Newer customers are spending less, whereas customers that have purchased since the start of the year contribute much more to the total revenue.
### Products
- WeAreA2B, Solex, and Giant Bicycles are the brands contributing most to revenue.
- In terms of product lines, Mountain Bikes are performing the worst by and contribute only around 13% of total revenue.
- There are many products with low volume sales that also have a low list price.


## Strategic reccomendations 

1. **Revenue** 
   - Investigate why newer customers are spending less and look to improve efforts on customer retention for older cohorts.

2. **Cohorts**
   - Target January cohorts with personalized re-engagement offers
   - Implement loyalty/subscription programs
   - Investigate market strategy for the beginning of the year and see if this changed throughout the year.

3. **Products**
   - Consider discontinuing low list price and volume of sales products, potentially offering a large discount to quickly move the inventory OR consider pushing marketing for these poor performing products.
   - Focus on targeted advertising for high performing products.

## Technical details

- **Database:** PostgreSQL
- **Analysis tools:** PostgreSQL


