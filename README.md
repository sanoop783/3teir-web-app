
**To Deploy a three-tier shopping application using Docker**

you need a setup that includes 

1. **Frontend (Web Layer):** Handles the user interface.
2.  **Backend (API):** Manages the request  from frontend and database.
3.  **Database** : store the data
   

Below is a step-by-step guide:

![image](https://github.com/user-attachments/assets/ff3a189d-dcc8-4198-a17e-9bc7a5e7d121)




**Prerequisites**

1. Install Docker and Docker Compose.
2. Have the application files ready (e.g., frontend code, backend configuration, database schema).
3.  Prepare a Docker network for inter-container communication **(Optional)**.

Step 1: Write **Frontend Dockerfile**  &  **Backend Dockerfile**

Step 2: Create **Application Files**

        Frontend (index.html)
                
        Backend (app.py)
        
        Backend (requirements.txt)

        Database (init.sql)
        
Step 3: Create the Docker images and network 

**Navigate to the shopping-app directory:**

    docker build -t frontend:3t-app .
    docker build -t backend:3t-app .
    docker build -t database:3t-app .

   **To create the networks**

    docker network create 3t-app
   
Step 4: Deploy the Application

        docker run -d --name frontend --network app-network -p 80:80 frontend:3t-app
        docker run -d --name database-container --network 3t-app  -e MYSQL_DATABASE=shopping_db -e MYSQL_ROOT_PASSWORD=rootpassword -p 3306:3306 database:3t-app
        docker run -d --name backend-container --network 3t-app  -e DB_HOST=database-container -e DB_USER=root -e DB_PASSWORD=rootpassword -e DB_NAME=shopping_db -p 5000:5000  backend:3t-app
        


Step 5: Access the Application

Open your browser and navigate to **http://localhost:8080** to view the shopping app frontend.
The frontend fetches product data from the backend via **http://backend:5000/items**


