# Hero_Electronics_Product_Performance_and_Optimization_Analysis 

<p align="center">
  <img width="50%" src="https://github.com/handokosugiarto/Private/blob/1b14b6b8bebc76e13d87233dc8b3b7c528495441/Global%20Retailers/Hero%20Electronics.png">

## Company Background

Hero Electronics is a global consumers electronics retail chain stores that operates across North America, Europe, and Australia with 67 stores serving United States, Canada, United Kingdom, France, Netherlands, Germany, Italy, and Australia. Since the establishment in 2016, the company has offered a diverse portfolio of consumer electronics including audio, camera and camcorder, cellular phone, computers, games, toys, home appliances, TV and video, music, movies, and audio books. 

Between 2016 - 2019, Hero Electronics experienced strong business growth with annual revenue increasing from US$ 6.95 million to US$ 18.27 million. However Covid19 pandemic significantly disrupted business operations, causing annual revenues to decline by approximately 49% from US$ 18.27 million in 2019 to US$ 9.30 million in 2020.  The management had done very well with the sales ranging from US$ 6,947K to US$ 18,265K (2016-2019) and dropped by 49% from US$ 18,265K to US$ 9,295K  after Covid19 pandemic hit in 2020. This sudden market shift created new challenges for the product team in evaluate product performance, prioritizing investment, and optimizing the product portfolio under changing customer demand.

**Business question:** As a part of the data team, I analyze sales performance from 2016 to 2021 to identify high performing (high margin, and high growth) to low performing (low margin & Low Sales) product categories. The objective is to help Product Managers optimize the product portfolio, improve profitability, and support strategic product investment decisions.

## North Star Metric

**Total Profit** is the key metric in this project to answer how profitable our product portfolios are. By measuring this key metrics, I will be able to help the product team to create strategic decision making whether to expand, improve, invest, or review their product portfolios. As the result of their decision making, we would expect company's profit to go up.

Other metrics are also needed to support the success of our project such as total sales, total quantity, average selling price, and profit margin. By combining these metrics, we would be able to create powerful fact based data to support product team on their mission to optimize performance the company's product portfolio.

Interactive Tableau's dashboard can be explored [here](https://public.tableau.com/app/profile/handoko.sugiarto/viz/Globalretailer/ProductOptimization)

SQL queries analysis here


## Data Structure Overview

The dataset is organized as a star schema model, with one fact table and multiple dimension tables. Compared with a single flat table, it reduces redundancy while remaining optimized for analysis. The dataset consists of four tables: three dimensions that are products, stores, customers, and one fact table that is sales, with a total row count of 62,885 records.

<img src= "https://github.com/handokosugiarto/Private/blob/4c636d5692f644f04073e938f4f334e42e3f3588/Global%20Retailers/Data%20Structure.png" width="95%">

## Executive Summary

### Overview of Findings

**Business Growth:** Hero Electronics has done a very amazing performance over the year from 2016 to 2021. The business had been showing a positive growth from 2016 (US$ 6,947K) to 2019 (US$18,265K) with CAGR of 38% until the Covid19 pandemic happened in 2020. The revenue declined significantly to US$ 9295K in 2020 which was about 49% dropped from 2019. 

**Revenue Drivers:** The main revenue driver is desktop subcategory with its revenue ranging from US$ 725K to US$ 1,777K with 20% contribution from the total revenue in 2019. 

**Profitability Insights:** Desktop subcategory drives the profitability with US$ 5,629K or 17% from total profit from 2016 to 2021. Although Desktop subcategory has higher total profit but the profit ratio is being driven by projector and screen subcategory with total margin 63% while desktop is about 57%.

**Portfolio Opportunities:** Products that have growth potential are products which are considered as high margin & high sales such as projector & screen, digital camera, televisions, camcorders, movie DVD, and Refrigerator. These product subcategories represent the strongest product subcategories to invest or grow while low margin & low sales such as air conditioners, home theater system, lamps, car video, recording pen, camera, camcorder, and VCD/DVD. 

![Overview of Findings](https://github.com/handokosugiarto/Hero_Electronics_Product_Performance_and_Optimization_Analysis/blob/bc248f4865efc703197b2690bcdf30b53513458a/Products%20Optimization.png)

## Insights Deep Dive

### Revenue Trends,

- **Strong pre COVID growth was primarily volume driven.** Hero Electronics' revenue performance increased from  US$ 6,947K in 2016 to US$ 18,265K in 2019 representing 163% growth. During the same period, quantity sold increased from 21.4K to 68.4K, representing 215% growth, while average selling price (ASP) declined by 14% from US$ 311 to US$ 267. Profit increased by 160% from US$ 4,107K to US$10,698K. These results suggest that the revenue growth primarily driven by increased in sales volume rather than higher pricing. The decline in average selling price may indicate shift toward lower price product and/or changes in pricing strategy. Despite lower ASP, The total profit remained high but the profit margin slightly decreased to 58.5%  from 59% which indicating that the efficiency was maintained during the growth period.  
- **COVID19 coincided with a significant decline in business performance, while profitability efficiency remained stable.** The revenue declined from US$ 18,265K in 2019 to US$ 9,295K in 2020, representing 49% decrease. A downward trend in revenue followed by a decrease in volume sales from 68.4K units to 34.4K units, representing 50% decrease. Average selling price remained stable at US$ 267 and total profit declined by 49% from US$ 10,698K to US$ 5,448K These indicators suggests that decrease in revenue, sales volume, and total profit were not impacting the profitability efficiency since the profit margin remained stable at 59%.
- **Seasonality trends demand peaks started from Q3 to Q4 where the revenue was primarily volume driven, total profit remained high with stable profit margin.** The revenue's recurring seasonal pattern started from Q3 to Q4 which representing approximately 27% from Q2 to Q3, and 35% from Q3 to Q4. During those periods, the sales volume increased by 30% from Q2 to Q3 and 34% from Q3 to Q4. The average selling price remained stable ranging from US$ 278 to US$ 279 and Total profit increased by 27% from Q2 to Q3 and 35% from Q3 to Q4, while profit margin remained stable at 58%. The indicators suggest that the revenue increased during seasonality peak periods was driven by sales volume with slight changes in average selling price (may correlated with price discounting or product mixed shifting). Despite slight changes in ASP, the total profit remained high with a stable profit margin.     


