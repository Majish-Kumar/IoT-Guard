# ===============================================
# IoT Monitor - Combined Startup Script (Safe Version)
# ===============================================

Write-Host "Starting IoT Network Monitor..."

# --- Paths
$backendPath = "C:\iot-monitor\backend"
$frontendPath = "C:\iot-monitor\frontend"
$venvPath = "$backendPath\venv\Scripts\activate"

# --- Start Backend (FastAPI)
Write-Host ""
Write-Host "Starting Backend API..."
Start-Process powershell -ArgumentList "-NoExit", "-Command", "
    cd '$backendPath';
    & '$venvPath';
    uvicorn app:app --reload --port 8000
"

# --- Wait a bit before launching frontend
Start-Sleep -Seconds 5

# --- Start Frontend (React)
Write-Host ""
Write-Host "Starting Frontend Dashboard..."
Start-Process powershell -ArgumentList "-NoExit", "-Command", "
    cd '$frontendPath';
    npm start
"

Write-Host ""
Write-Host "Both Backend and Frontend are launching..."
Write-Host "Frontend: http://localhost:3000"
Write-Host "Backend:  http://127.0.0.1:8000"
Write-Host ""
Write-Host "Press Ctrl + C in each window to stop the servers."
