
# **Server Health Checking System**

This is a Laravel-based application that checks the health of servers supporting protocols like HTTP, HTTPS, FTP, and SSH. It logs server health, notifies admins via email if status goes from healthy to unhealthy, and provides a RESTful API for managing servers and request data.

---

## **Prerequisites**
1. **PHP**: Version 8.1 or higher.
2. **Composer**: Dependency manager for PHP.
3. **MySQL**: For database operations.
4. **Postman** (or any API testing tool): For API testing.
5. **Mail Server** (e.g., Mailtrap, Gmail): For email notifications.

---

## **Setup Instructions**

### **1. Clone the Repository**
```bash
git clone <repository-url>
cd server-health
```

### **2. Install Dependencies**
Run the following command to install the dependencies:
```bash
composer install
```

### **3. Environment Configuration**
Create a `.env` file by copying the example file:
```bash
cp .env.example .env
```

Edit the `.env` file to set up your environment:
```env
APP_NAME=ServerMonitoring

DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=server_health
DB_USERNAME=root
DB_PASSWORD=

```

### **4. Set Up Database**
1. Create a database named `server_health`.
2. Run migrations to create the required tables:
   ```bash
   php artisan migrate
   ```
1. You can import database sql from db_dump directory.
---

## **Usage**

### **1. Start the Server**
Run the Laravel development server:
```bash
php artisan serve
```

Access the application at [http://localhost:8000](http://localhost:8000).

---

### **2. API Endpoints**
Use Postman (or similar) to interact with the API:

#### **Base URL**
```
http://localhost:8000/api
```

#### **Endpoints**
| HTTP Method | Endpoint                           | Description                                    |
|-------------|------------------------------------|------------------------------------------------|
| POST        | `/servers`                        | Add a new server                              |
| GET         | `/servers`                        | List all servers and their health status      |
| GET         | `/servers/{id}`                   | Get server details and its last 10 requests   |
| PUT         | `/servers/{id}`                   | Update server details                         |
| DELETE      | `/servers/{id}`                   | Delete a server                               |
| GET         | `/servers/{id}/requests`          | Get request history of a server               |
| GET         | `/servers/{id}/health-at/{time}` | Check if a server was healthy at a given date-time |


---

### **3. Check Servers**
The server check (requesting) process runs every minute. You can manually run it using the command:
```bash
php artisan check:servers
```

#. To automate, Set up a cron job on the server

---

### **4. Email Notifications**
Emails are sent when a server's health status changes to Unhealthy. Configure email settings in the `.env` file (Use a service like Mailtrap for testing.):

MAIL_MAILER=smtp
MAIL_HOST=sandbox.smtp.mailtrap.io
MAIL_PORT=2525
MAIL_USERNAME=76bb392b8d25ae
MAIL_PASSWORD=0009dba798d099
MAIL_ENCRYPTION=tls
MAIL_FROM_ADDRESS=victorjonathon@gmail.com
MAIL_FROM_NAME="Health Monitor"

---

### **5. POSTMAN FILE**
 You can import postman file with all api endpoints for testing. The file is: Server_Health_Check.postman_collection.json