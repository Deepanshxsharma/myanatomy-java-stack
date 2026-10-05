# Inventory Management System

A menu-driven console application for managing a product inventory. It supports full CRUD operations on products and categories, stock tracking, and low-stock reporting, with all data persisted to disk between runs.

![Java](https://img.shields.io/badge/Java-11%2B-ED8B00?logo=openjdk&logoColor=white)
![Module](https://img.shields.io/badge/Module-1-blue)

---

## Features

| Area | Capabilities |
|------|--------------|
| **Products** | Add, view, search by name (case-insensitive), update, delete |
| **Categories** | Add, view, update, delete (blocked while a product still uses the category) |
| **Stock** | Add stock, remove stock with availability checks |
| **Reports** | Low-stock report for products with 5 or fewer units |
| **Persistence** | Automatic save after every change using Java object serialization |
| **Validation** | Re-prompts on invalid numbers and empty input; confirms before deleting |

---

## Architecture

```
┌──────────────┐     ┌────────────────────┐     ┌───────────────┐
│   Main       │ ──▶ │  InventoryManager  │ ──▶ │  FileManager  │ ──▶ products.dat
│ (Console UI) │     │  (Business logic)  │     │ (Persistence) │ ──▶ categories.dat
└──────────────┘     └────────────────────┘     └───────────────┘
                              │
                     ┌────────┴────────┐
                     ▼                 ▼
                 Product           Category
                 (Model)            (Model)
```

| Class | Responsibility |
|-------|----------------|
| `Main` | Entry point; renders menus, reads and validates user input |
| `InventoryManager` | Core operations on products, categories, and stock; ID generation |
| `FileManager` | Saves and loads data with `ObjectOutputStream` / `ObjectInputStream` |
| `Product` | Serializable model: id, name, category, price, stock |
| `Category` | Serializable model: id, name |

---

## Getting Started

**Requirements:** JDK 11 or later

```bash
cd "Module - 1/Inventory Management System"
javac *.java
java Main
```

The app reads and writes `products.dat` and `categories.dat` in the current directory, so run it from inside the project folder. A sample `products.dat` is included.

---

## Menu Overview

```
==========================================
              MAIN MENU
==========================================
1. Product Management
2. Category Management
3. Stock Management
4. Low Stock Report
5. Exit
```

Each management option opens a submenu:

- **Product Management:** Add, View, Search, Update, Delete
- **Category Management:** Add, View, Update, Delete
- **Stock Management:** Add Stock, Remove Stock, View Products

### Sample Output

```
---------------- PRODUCT LIST ----------------
ID: 1 | Name: Pepsodent | Category: FMCG | Price: 10.00 | Stock: 10
----------------------------------------------
```

---

## Concepts Demonstrated

- Encapsulation and model classes
- `Serializable` and object streams for persistence
- `try-with-resources` for safe resource handling
- Layered design separating UI, logic, and storage
- Robust console input handling with `Scanner`
