# RealWorld Vue Golang Social App - Backend Services

This project consists of three main backend microservices built in Golang. 

## Running the Microservices

You can easily run all the backend microservices at once using the provided scripts.

Note You need to have Docker and run this command 

   docker-compose up -d 

becuse this requreid redis to be runing 

### For Windows Users
1. Double-click on `run_microservices.bat` in the project root directory, or run it from your terminal:
   ```cmd
   .\run_microservices.bat
   ```
2. Three separate command prompt windows will open, one for each microservice (`api`, `realTimeChat`, and `realTimeNotification`).

### For macOS and Linux Users
1. Open your terminal in the project root directory.
2. Make the script executable (only needed the first time):
   ```bash
   chmod +x run_microservices.sh
   ```
3. Run the script:
   ```bash
   ./run_microservices.sh
   ```
All three services will start in the background within the same terminal, and their logs will stream there. You can stop all services by pressing `CTRL+C`.

## Testing the REST API

The `api` microservice includes Swagger documentation for exploring and testing the REST API endpoints.

- **Swagger UI:** [http://localhost:5000/swagger/](http://localhost:5000/swagger/)
- **Host:** `localhost:5000`

You can use the Swagger UI to see all available routes, models, and test requests directly from your browser. 

> Note: To test secured endpoints, you will need to log in, get the JWT token, and click on the "Authorize" button in Swagger to input your token (format: `Bearer <your_token>`).

## Testing Real-Time Chat & Notifications (Postman)

The application uses WebSockets for real-time chat and notifications. You can test these connections using Postman's WebSocket request feature.

### 1. Real-Time Chat Service
The Chat service runs on port `8001`.
- **URL:** `ws://localhost:8001/ws/:id`
  *(Replace `:id` with a valid user ID)*

**How to test in Postman:**
1. Open Postman, click **New** -> **WebSocket Request**.
2. Enter the URL: `ws://localhost:8001/ws/123` (using `123` as a sample user ID).
3. Click **Connect**. If successful, it should say "Connected".
4. To test sending a message, select **JSON** as the message format and send a JSON payload according to the `realtime.Message` structure.

### 2. Real-Time Notification Service
The Notification service runs on port `8088`.
- **URL:** `ws://localhost:8088/ws/:userId`
  *(Replace `:userId` with a valid user ID)*

**How to test in Postman:**
1. Open Postman, click **New** -> **WebSocket Request**.
2. Enter the URL: `ws://localhost:8088/ws/123` (using `123` as a sample user ID).
3. Click **Connect**. 
4. The server expects JSON payloads containing notification data, but it also listens to notifications sent via gRPC from the main API and pushes them to connected WebSocket clients.
