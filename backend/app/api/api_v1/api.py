"""
API v1 Router
"""

from fastapi import APIRouter

api_router = APIRouter()

# Health check for API
@api_router.get("/health")
async def api_health():
    """API health check endpoint"""
    return {"status": "healthy", "version": "v1"}