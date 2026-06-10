#!/bin/bash

echo "========================================================"
echo "Starting RealWorld Social App Microservices..."
echo "========================================================"

echo "[1/3] Starting API Service (Port 5000/5001)..."
(cd backend/api && go run ./cmd) &
API_PID=$!

echo "[2/3] Starting RealTime Chat Service (Port 8001)..."
(cd backend/realTimeChat && go run main.go) &
CHAT_PID=$!

echo "[3/3] Starting RealTime Notification Service (Port 8088)..."
(cd backend/realTimeNotification && go run main.go) &
NOTIF_PID=$!

echo "========================================================"
echo "All microservices are running. Logs will appear below."
echo "Press [CTRL+C] to stop all services."
echo "========================================================"

# Trap SIGINT (Ctrl+C) to elegantly kill the background processes
trap "echo 'Stopping all services...'; kill $API_PID $CHAT_PID $NOTIF_PID; exit" SIGINT

# Wait for all background processes
wait
