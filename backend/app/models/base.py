"""
Base model with common fields and utilities
"""

from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, DateTime, String, func
from datetime import datetime
import uuid


Base = declarative_base()


class TimestampMixin:
    """Mixin to add timestamp columns to models"""
    
    created_at = Column(DateTime, default=func.now(), nullable=False)
    updated_at = Column(DateTime, default=func.now(), onupdate=func.now(), nullable=False)


class UUIDMixin:
    """Mixin to add UUID primary key to models"""
    
    def generate_uuid():
        return str(uuid.uuid4())
    
    id = Column(String, primary_key=True, default=generate_uuid)