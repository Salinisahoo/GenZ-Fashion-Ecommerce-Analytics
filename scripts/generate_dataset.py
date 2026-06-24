import pandas as pd
import random
from datetime import datetime, timedelta

random.seed(42)

# =====================================
# CONFIGURATION
# =====================================

NUM_CUSTOMERS = 5000
NUM_PRODUCTS = 500
NUM_ORDERS = 50000


# =====================================
# CUSTOMER DATA
# =====================================

cities = [
    "Delhi",
    "Mumbai",
    "Bangalore",
    "Hyderabad",
    "Pune",
    "Chennai",
    "Kolkata",
    "Jaipur",
    "Ahmedabad",
    "Lucknow"
]

customer_types = [
    "Trend Shopper",
    "Casual Shopper",
    "Premium Shopper",
    "Discount Hunter"
]

customers = []

for customer_id in range(1, NUM_CUSTOMERS + 1):
    customers.append([
        customer_id,
        random.randint(18, 35),
        random.choice(["Female", "Male"]),
        random.choice(cities),
        random.choice(customer_types)
    ])


customers_df = pd.DataFrame(
    customers,
    columns=[
        "customer_id",
        "age",
        "gender",
        "city",
        "customer_type"
    ]
)


# =====================================
# PRODUCT DATA
# =====================================

fashion_products = {
    "Tops": [
        "Baby Tee",
        "Corset Top",
        "Crop Top",
        "Oversized T-Shirt"
    ],
    "Bottoms": [
        "Cargo Pants",
        "Mini Skirt",
        "Baggy Jeans"
    ],
    "Outerwear": [
        "Hoodie",
        "Denim Jacket"
    ],
    "Footwear": [
        "Sneakers",
        "Boots"
    ],
    "Accessories": [
        "Handbag",
        "Sunglasses",
        "Jewellery"
    ]
}

styles = [
    "Y2K",
    "Streetwear",
    "Coquette",
    "Minimalist",
    "Korean Fashion"
]


products = []

for product_id in range(1, NUM_PRODUCTS + 1):

    category = random.choice(list(fashion_products.keys()))

    product_name = random.choice(
        fashion_products[category]
    )

    price = random.randint(399, 3999)

    cost_price = round(
        price * random.uniform(0.40, 0.70),
        2
    )

    products.append([
        product_id,
        product_name,
        category,
        random.choice(styles),
        price,
        cost_price
    ])


products_df = pd.DataFrame(
    products,
    columns=[
        "product_id",
        "product_name",
        "category",
        "style",
        "price",
        "cost_price"
    ]
)


# =====================================
# ORDERS DATA
# =====================================

payment_modes = [
    "UPI",
    "Credit Card",
    "Debit Card",
    "Cash on Delivery"
]

start_date = datetime(2023, 1, 1)
end_date = datetime(2025, 12, 31)

orders = []


for order_id in range(1, NUM_ORDERS + 1):

    random_days = random.randint(
        0,
        (end_date - start_date).days
    )

    order_date = start_date + timedelta(
        days=random_days
    )

    orders.append([
        order_id,
        random.randint(1, NUM_CUSTOMERS),
        random.randint(1, NUM_PRODUCTS),
        order_date.date(),
        random.randint(1, 5),
        random.choice([
            0,
            5,
            10,
            15,
            20,
            25,
            30
        ]),
        random.choice(payment_modes)
    ])


orders_df = pd.DataFrame(
    orders,
    columns=[
        "order_id",
        "customer_id",
        "product_id",
        "order_date",
        "quantity",
        "discount",
        "payment_mode"
    ]
)


# =====================================
# SAVE CSV FILES
# =====================================

customers_df.to_csv(
    "data/customers.csv",
    index=False
)

products_df.to_csv(
    "data/products.csv",
    index=False
)

orders_df.to_csv(
    "data/orders.csv",
    index=False
)


print("""
====================================
 DATASET GENERATED SUCCESSFULLY
====================================

Files created:

1. customers.csv  (5000 rows)
2. products.csv   (500 rows)
3. orders.csv     (50000 rows)

Location:
GenZ-Fashion-Ecommerce-Analytics/data
""")