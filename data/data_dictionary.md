# Data Dictionary

## customers

| Column        | Description                                    |
| ------------- | ---------------------------------------------- |
| customer_id   | Unique customer identifier                     |
| age           | Customer age (18–35)                           |
| gender        | Male/Female                                    |
| city          | Customer's city                                |
| customer_type | Premium Shopper, Trend Shopper, Casual Shopper |

---

## products

| Column       | Description                                           |
| ------------ | ----------------------------------------------------- |
| product_id   | Unique product identifier                             |
| product_name | Fashion product name                                  |
| category     | Tops, Bottoms, Footwear, Accessories                  |
| style        | Y2K, Streetwear, Korean Fashion, Coquette, Minimalist |
| price        | Selling price                                         |
| cost_price   | Product cost                                          |

---

## orders

| Column       | Description                                    |
| ------------ | ---------------------------------------------- |
| order_id     | Unique order identifier                        |
| customer_id  | Links to customers table                       |
| product_id   | Links to products table                        |
| order_date   | Purchase date                                  |
| quantity     | Units purchased                                |
| discount     | Discount percentage                            |
| payment_mode | UPI, Credit Card, Debit Card, Cash on Delivery |
