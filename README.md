# Timesheet Management API

A Laravel-based API for managing users, projects, and timesheets with dynamic attributes.

---

## 🚀 Setup Instructions

Follow these steps to install and set up the project:

### **1️⃣ Clone the Repository**
```bash
git clone https://github.com/mahmoudali29/TimesheetManagement.git
cd TimesheetManagement
```

### **2️⃣ Install Dependencies**
```bash
composer install
npm install
```

### **3️⃣ Set Up Environment Variables**
```bash
cp .env.example .env
php artisan key:generate
```
Edit the `.env` file and configure database credentials:
```env
DB_DATABASE=timesheet_management
DB_USERNAME=root
DB_PASSWORD=yourpassword
```

### **4️⃣ Import the Database**
```bash
mysql -u root -p timesheet_management < timesheet_management.sql
```

### **5️⃣ Run Migrations & Seeders**
```bash
php artisan migrate --seed
```

### **6️⃣ Install Passport for Authentication**
```bash
php artisan passport:install
```

### **7️⃣ Start the Application**
```bash
php artisan serve
```
Your API is now running at `http://127.0.0.1:8000/`

---

## 📌 API Documentation

### 🔹 Authentication Endpoints
| Method | Endpoint           | Description |
|--------|-------------------|-------------|
| POST   | `/api/register`   | Register a new user |
| POST   | `/api/login`      | Authenticate and get a token |
| POST   | `/api/logout`     | Logout and revoke token |

### 🔹 User Management
| Method | Endpoint           | Description |
|--------|-------------------|-------------|
| GET    | `/api/users`       | Get all users |
| GET    | `/api/users/{id}`  | Get a single user |
| POST   | `/api/users`       | Create a user |
| PUT    | `/api/users/{id}`  | Update user details |
| DELETE | `/api/users/{id}`  | Delete a user |

### 🔹 Project Management
| Method | Endpoint           | Description |
|--------|-------------------|-------------|
| GET    | `/api/projects`    | Get all projects |
| GET    | `/api/projects/{id}` | Get a project with attributes |
| POST   | `/api/projects`    | Create a new project |
| PUT    | `/api/projects/{id}` | Update project details |
| DELETE | `/api/projects/{id}` | Delete a project |

### 🔹 Timesheet Management
| Method | Endpoint           | Description |
|--------|-------------------|-------------|
| GET    | `/api/timesheets`  | Get all timesheets |
| GET    | `/api/timesheets/{id}` | Get a specific timesheet |
| POST   | `/api/timesheets`  | Log a new timesheet entry |
| PUT    | `/api/timesheets/{id}` | Update a timesheet entry |
| DELETE | `/api/timesheets/{id}` | Delete a timesheet entry |

### 🔹 Dynamic Filtering API
| Method | Endpoint | Description |
|--------|---------|-------------|
| GET | `/api/dynamic_search?filters[name:like]=Project` | Search for projects with "Project" in the name |
| GET | `/api/dynamic_search?filters[status]=active&filters[department:like]=IT` | Get active projects in IT department |
| GET | `/api/dynamic_search?filters[budget:gt]=10000` | Get projects with budget greater than 10,000 |

---

## 📌 Example Requests & Responses

### **1️⃣ Register a New User**
**Request:**
```bash
POST /api/register
```
**Body:**
```json
{
    "first_name": "John",
    "last_name": "Doe",
    "email": "johndoe@example.com",
    "password": "password123"
}
```
**Response:**
```json
{
    "message": "User registered successfully",
    "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJS..."
}
```

### **2️⃣ Login and Get Token**
**Request:**
```bash
POST /api/login
```
**Body:**
```json
{
    "email": "admin@admin.com",
    "password": "password123"
}
```
**Response:**
```json
{
    "message": "Login successful",
    "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJS...",
    "user": {
        "id": 1,
        "first_name": "Mahmoud",
        "last_name": "Ali",
        "email": "admin@admin.com"
    }
}
```

### **3️⃣ Get All Projects**
**Request:**
```bash
GET /api/projects
```
**Response:**
```json
[
    {
        "id": 1,
        "name": "Project Alpha",
        "status": "active",
        "attributes": {
            "department": "IT"
        }
    }
]
```

---

## 🧑‍💻 Test Credentials
Use the following credentials for testing:

```json
{
    "email": "admin@admin.com",
    "password": "password123"
}
```
```
Authorization: Bearer YOUR_ACCESS_TOKEN
```

---

## 📌 Notes
- **Ensure you include the Bearer Token in API requests.**
- **Use Postman or any API client to test endpoints.**
- **If needed, run `php artisan migrate:fresh --seed` to reset the database.**

---

## 🎯 Contributors
- **Mahmoud Ali**

---


