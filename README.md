# 🏢 Office Registration Management System

This is a web-based **Office Registration Management System** developed using ASP.NET Web Forms and MySQL. The system is designed to manage employee registrations, approvals, department assignments, and profile management. It supports two primary user roles — **HR** and **Employee** — each with their own access and functionality.

> ⚠️ **Note**: This version of the project is developed without using 3-tier architecture.  
> A future update will include a full 3-tier architectural implementation (UI Layer, Business Logic Layer, and Data Access Layer).

---

## 👥 User Roles & Features

### 🔹 HR (Human Resources)
- Secure login using DB credentials.
- View all employee registrations (**pending**, **approved**).
- Approve or reject employee applications.
- Add or remove departments (stored in the DB).
- Edit or delete employee records post-approval.
- Dashboard view showing stats like:
  - Total employees
  - Pending approvals
  - Total departments

### 🔹 Employee
- Register via a form including department preference (fetched from DB).
- Registration remains **pending** until approved by HR.
- Can log in only after HR approval.
- Post-login features:
  - View and update profile.
  - View assigned department.

---

## 🔁 Workflow Overview

1. **Employee Registration**
   - Inputs: Basic info + preferred department (dropdown from DB).
   - Status set to `Pending` after submission.

2. **HR Review**
   - HR logs in and reviews new registrations.
   - Can approve or reject each entry.

3. **Post Approval**
   - Approved employees can log in using their credentials.
   - Rejected users cannot access the system.

---

## 💡 Features & Highlights

- Role-based login and dashboard redirection.
- Department management by HR (Add/Delete).
- Cascading dropdowns (Country → State → City) in the profile section.
- Client-side + server-side validations for all forms.
- Clean, responsive UI using modern styling (Bootstrap + custom CSS).
- Error/success messages for actions (e.g., approval, registration).

---

## 🏗️ Upcoming: 3-Tier Architecture

In the next version, this system will be upgraded to follow a **3-tier architecture**, which includes:

- **UI Layer (Presentation Layer):**
  - Handles user interface and browser interactions (HTML, JS, ASPX).
- **Business Logic Layer (BLL):**
  - Contains the core logic and rules of the system (validations, decisions).
- **Data Access Layer (DAL):**
  - Handles direct interaction with the database (CRUD operations).

**Benefits of 3-Tier Architecture:**
- Separation of concerns
- Easier maintenance and testing
- Better scalability and reusability
- Clean project structure

---

## 📁 Tech Stack

- **Frontend:** ASP.NET Web Forms, HTML5, CSS3, JavaScript, jQuery
- **Backend:** C#, ASP.NET Web Forms, ADO.NET
- **Database:** MySQL
- **Web Services:** ASMX (for client-side AJAX calls)
- **Architecture:** Monolithic (currently) — planned upgrade to 3-tier

---

## 📌 Author

## 🙋‍♂️ About Me

I’m currently working as an **intern at Vegam Solutions**, where I’m gaining practical experience in full-stack development. This project was built to strengthen my understanding of scalable architecture, clean code practices, and integration of modern tools like **Knockout.js** with ASP.NET and WCF services.

---


