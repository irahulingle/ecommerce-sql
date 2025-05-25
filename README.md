# ecommerce-sql
# 🛒 E-Commerce SQL Database

This project defines a simple e-commerce system using **MySQL**. It includes SQL scripts to create and populate the following tables:

- `customers`
- `orders`
- `products`
- `order_items` (for normalization)

The database is named **`ecommerce`**.

---

## 📦 Features

- Create customers, products, and orders
- Track individual items in each order
- Perform analytical queries like:
  - Customers who ordered in the last 30 days
  - Total amount spent by each customer
  - Top 3 most expensive products
  - Orders over a certain total
  - Product-specific customer reports

---

## 🏗️ Database Structure

### `customers`
| Column     | Type         | Description                    |
|------------|--------------|--------------------------------|
| id         | INT, PK      | Auto-increment ID              |
| name       | VARCHAR      | Customer name                  |
| email      | VARCHAR      | Email address                  |
| address    | VARCHAR      | Shipping address               |

### `orders`
| Column      | Type         | Description                       |
|-------------|--------------|-----------------------------------|
| id          | INT, PK      | Auto-increment order ID           |
| customer_id | INT, FK      | Linked to `customers(id)`         |
| order_date  | DATE         | Date of order                     |
| total_amount| DECIMAL      | Total value of the order          |

### `products`
| Column     | Type         | Description                      |
|------------|--------------|----------------------------------|
| id         | INT, PK      | Auto-increment product ID        |
| name       | VARCHAR      | Product name                     |
| price      | DECIMAL      | Price per unit                   |
| description| TEXT         | Description of the product       |
| discount   | DECIMAL      | Optional discount field          |

### `order_items`
| Column      | Type         | Description                          |
|-------------|--------------|--------------------------------------|
| id          | INT, PK      | Auto-increment ID                    |
| order_id    | INT, FK      | Linked to `orders(id)`               |
| product_id  | INT, FK      | Linked to `products(id)`             |
| quantity    | INT          | Number of units                      |
| price       | DECIMAL      | Price at time of order               |

---

## 🚀 Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/your-username/ecommerce-sql.git
cd ecommerce-sql
