# Hero_Electronics_Product_Performance_and_Optimization_Analysis 

<p align="center">
  <img width="50%" src="https://github.com/handokosugiarto/Private/blob/1b14b6b8bebc76e13d87233dc8b3b7c528495441/Global%20Retailers/Hero%20Electronics.png">

## Company Background

Hero Electronics is a global consumers electronics retail chain stores that operates across North America, Europe, and Australia with 67 stores serving United States, Canada, United Kingdom, France, Netherlands, Germany, Italy, and Australia. Since the establishment in 2016, the company has offered a diverse portfolio of consumer electronics including audio, camera and camcorder, cellular phone, computers, games, toys, home appliances, TV and video, music, movies, and audio books. 

Betweem 2016 - 2019, Hero Electronics experienced strong business growth with annual revenue increasing from US$ 6.95 million to US$ 18.27 million. However Covid19 pandemic significantly disrupted business operations, causing annual revenues to decline by approximately 49% from US$ 18.27 million in 2019 to US$ 9.30 million in 2020.  The management had done very well with the sales ranging from US$ 6,947K to US$ 18,265K (2016-2019) and dropped by 49% from US$ 18,265K to US$ 9,295K  after Covid19 pandemic hit in 2020. This sudden market shift created new challenges for the product team in evaluate product performance, prioritizing investment, and optimizing the product portfolio under changing customer demand.

As a part of the data team, I analyze sales performance from 2016 to 2021 to identify high performing, high margin, and high growth product categories. The objective is to help Product Managers optimize the product portfolio, improve profitability, and support strategic poduct investment decisions.

## North Star Metric

Total Profit is the key metric in this project to answer how profitable our product portfolios are. By measuring this key metrics, I will be able to help the product team to create strategic decision making whether to expand, improve,invest, or review their product portfolios. As the result of their decision making, we would expect company's profit to go up.

Other metrics are also needed to support the success of our project such as total sales, total quantity, average selling price, and profit margin. By combining these metrics, we would be able to create powerful fact based data to support product team on their mission to optimize performance the company's product portfolio.

Interactive Tableau's dashboard can be explored [here](https://public.tableau.com/app/profile/handoko.sugiarto/viz/Globalretailer/ProductOptimization)

SQL queries analysis here


## Data Structure Overview

The dataset is organized as a star schema, with one fact table and multiple dimension tables. Compared with a single flat table, it reduces redudancy while remaining optimized for analysis. The dataset consists of four tables: three dimensions that are products, stores, customers, and one fact table that is sales, with a total row count of 62,885 records.

<img src= "https://github.com/handokosugiarto/Private/blob/4c636d5692f644f04073e938f4f334e42e3f3588/Global%20Retailers/Data%20Structure.png" width="95%">

## Executive Summary

### Overview of Findings

Hero Electronics has done a very amazing performance over the year from 2016 to 2021. The business had been showing a positive growth from 2016 (US$ 6,947K) to 2019 (US$18,265K) with CAGR of 38% until the Covid19 pandemic happened in 2020. The revenue declined significantly to US$ 9295K in 2020 which was about 49% dropped from 2019. 

The main revenue driver is desktop subcategory with its revenue ranging from US$ 725K to US$ 1,777K with 20% contribution from the total revenue in 2019. Desktop subcategory drive the profitability also but the profit ratio is being driven by projector and screen subcategory with total margin 63% while desktop is about 57%.

Products that have growth potential are products which are considered as high margin & high sales such as projector & screen, digital camera, televisions, camcorders, movie DVD, and Refrigerator. 
![Overview of Findings](https://github.com/handokosugiarto/Hero_Electronics_Product_Performance_and_Optimization_Analysis/blob/bc248f4865efc703197b2690bcdf30b53513458a/Products%20Optimization.png)




