# --- run_backend.ps1 ---
# Temporarily allow PowerShell to run scripts in this session
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force

# Activate the virtual environment
.\venv\Scripts\activate

# Install dependencies (only installs missing ones)
pip install fastapi uvicorn sqlalchemy

# Start the FastAPI backend with auto-reload
uvicorn backend.main:app --reload
