# Functional Requirements – Trip Expense Reporting System

## Overview
A system to plan a short cab trip visiting tourist places (nature reserves, temples, museums), meet friends/relatives, choose nightly accommodation (hotel/lodge/resort) based on availability, track all expenses (transport, accommodation, food, entry tickets, miscellaneous), monitor budget, and generate an expense report for Father’s approval and reimbursement.

---

## Functional Requirements

### 1. User Management
- Register / login user.  
- Store user profile (User ID, Name, Contact).

### 2. Trip Planning
- Create trip (Trip ID, Start Date, End Date, Budget).  
- Add places to visit (Place ID, Name, Type, Location).  
- Modify itinerary during trip (add/remove places or times).

### 3. Accommodation Management
- Search/record nightly accommodation (Accommodation ID, Name, Type, Price Per Night).  
- Choose accommodation per night based on availability.

### 4. Expense Tracking
- Record expenses by category and date: Transport (cab fare, tolls), Accommodation, Food, Entry Tickets, Miscellaneous.  
- Support sub-categories (e.g., Food → Breakfast/Lunch/Dinner).  
- Attach optional notes/receipts to each expense.

### 5. Budget Monitoring
- Maintain running total and remaining budget.  
- Warn when expenses approach or exceed budget.

### 6. Report Generation and Submission
- Generate detailed expense report grouped by date and category.  
- Summarize totals per category and overall total.  
- Submit report to Father (Father ID, Name) for approval and reimbursement.

### 7. Approval Workflow
- Support Father’s review, approval, or rejection of submitted reports.


# Normalization Techniques: 

When designing the ER model I applied standard normalization steps to reduce redundancy and ensure data consistency.

## First Normal Form (1NF)
I made sure every table (entity) has only atomic values — no lists or repeated groups inside a single field.  
For example, each **Expense** row stores **one amount** and **one category** (Food, Entry Ticket, Cab, Misc), not several comma-separated amounts in one column.

## Second Normal Form (2NF)
I removed partial dependencies on composite keys by placing attributes in tables where they fully depend on the primary key.  
For example, **Place** details (Place ID, Name, Type) are stored in the **Place** entity and referenced by **Trip** through a relationship, rather than repeating place details across trip records.

## Third Normal Form (3NF)
I removed transitive dependencies so non-key attributes depend only on the primary key.  
For instance, **Accommodation’s Price Per Night** belongs in the **Accommodation** entity (key = Accom ID) rather than inside Trip or Expense. Likewise, **Expense** holds **Category** and **Amount** so summarizing expenses by Trip is done by grouping on Trip ID.

---

## Why This Matters 
1) **Reduces redundancy** — same piece of information (like a place’s name) is stored once.  
2) **Prevents update anomalies** — changing a place’s address needs one update only.  
3) **Makes reporting easy** — you can sum expenses per category per trip by joining Expense to Trip.
