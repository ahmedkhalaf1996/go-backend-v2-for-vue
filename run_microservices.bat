@echo off
echo ========================================================
echo Starting RealWorld Social App Microservices...
echo ========================================================

echo [1/3] Starting API Service (Port 5000/5001)...
start "API Service" cmd /k "cd backend\api && go run ./cmd"

echo [2/3] Starting RealTime Chat Service (Port 8001)...
start "RealTime Chat Service" cmd /k "cd backend\realTimeChat && go run main.go"

echo [3/3] Starting RealTime Notification Service (Port 8088)...
start "RealTime Notification Service" cmd /k "cd backend\realTimeNotification && go run main.go"

echo ========================================================
echo All microservices have been launched in separate windows!
echo Please check the newly opened terminal windows for logs.
echo ========================================================
pause
