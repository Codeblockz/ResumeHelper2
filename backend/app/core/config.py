"""
Application configuration using Pydantic Settings
"""

from typing import List
from pydantic_settings import BaseSettings
from pydantic import Field
import os


class Settings(BaseSettings):
    """Application settings with environment variable support"""
    
    # Application settings
    ENVIRONMENT: str = Field(default="development", description="Application environment")
    DEBUG: bool = Field(default=True, description="Debug mode")
    SECRET_KEY: str = Field(default="your-secret-key-change-in-production", description="Secret key for JWT")
    
    # Database settings
    DATABASE_URL: str = Field(
        default="postgresql://postgres:password@localhost:5432/resume_tailor",
        description="Database connection URL"
    )
    
    # Redis settings
    REDIS_URL: str = Field(
        default="redis://localhost:6379",
        description="Redis connection URL"
    )
    
    # Ollama settings
    OLLAMA_URL: str = Field(
        default="http://localhost:11434",
        description="Ollama API base URL"
    )
    OLLAMA_MODEL: str = Field(
        default="llama3.1",
        description="Default Ollama model for resume tailoring"
    )
    OLLAMA_TIMEOUT: int = Field(
        default=120,
        description="Ollama API timeout in seconds"
    )
    
    # File upload settings
    MAX_UPLOAD_SIZE: int = Field(
        default=10 * 1024 * 1024,  # 10MB
        description="Maximum file upload size in bytes"
    )
    ALLOWED_FILE_TYPES: List[str] = Field(
        default=["application/pdf", "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "text/plain"],
        description="Allowed file MIME types for resume uploads"
    )
    UPLOAD_DIRECTORY: str = Field(
        default="uploads",
        description="Directory for uploaded files"
    )
    
    # Security settings
    ACCESS_TOKEN_EXPIRE_MINUTES: int = Field(
        default=60 * 24 * 7,  # 7 days
        description="Access token expiration time in minutes"
    )
    ALLOWED_HOSTS: List[str] = Field(
        default=["*"],
        description="Allowed hosts for TrustedHost middleware"
    )
    ALLOWED_ORIGINS: List[str] = Field(
        default=["http://localhost:3000", "http://frontend:3000"],
        description="Allowed origins for CORS"
    )
    
    # Resume tailoring settings
    MAX_RESUME_LENGTH: int = Field(
        default=50000,
        description="Maximum resume text length in characters"
    )
    MAX_JOB_DESCRIPTION_LENGTH: int = Field(
        default=20000,
        description="Maximum job description length in characters"
    )
    KEYWORD_DENSITY_TARGET: float = Field(
        default=0.025,
        description="Target keyword density (2.5%)"
    )
    
    # Rate limiting
    RATE_LIMIT_PER_MINUTE: int = Field(
        default=60,
        description="API rate limit per minute per user"
    )
    
    # Logging
    LOG_LEVEL: str = Field(
        default="INFO",
        description="Logging level"
    )
    
    class Config:
        env_file = ".env"
        case_sensitive = True


# Create global settings instance
settings = Settings()