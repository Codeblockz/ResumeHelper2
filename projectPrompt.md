# Resume Tailor App - Development Prompt

## Project Overview
Create a web-based resume tailoring application that uses Ollama (local LLM) to automatically customize resumes for specific job postings. The app should help users optimize their resumes for Applicant Tracking Systems (ATS) and increase interview opportunities.

## Core Functionality

### 1. Resume Input Methods
- **Upload existing resume**: Support PDF, DOCX, and TXT formats
- **Manual entry**: Provide a structured form for users to input resume details
- **Resume builder**: Step-by-step guided resume creation from scratch

### 2. Job Description Analysis
- **Job posting input**: Text area for pasting job descriptions
- **URL import**: Ability to fetch job postings from popular job sites
- **Key requirements extraction**: Identify essential skills, qualifications, and keywords

### 3. AI-Powered Resume Tailoring
- **Keyword optimization**: Match resume content with job description keywords
- **Skills alignment**: Emphasize relevant skills and experiences
- **ATS optimization**: Ensure proper formatting and keyword density
- **Content suggestions**: Recommend additions, modifications, or reordering
- **Achievement quantification**: Suggest metrics and numbers to strengthen impact

## Technical Architecture

### Backend Requirements
- **Ollama Integration**: Use local LLM models (recommend Llama 3.1, Mistral, or Code Llama)
- **API Framework**: FastAPI or Flask for Python, or Express.js for Node.js
- **Document Processing**: 
  - PDF parsing (PyPDF2, pdfplumber, or pdf-parse)
  - DOCX parsing (python-docx or mammoth.js)
- **Database**: SQLite for local development, PostgreSQL for production
- **File Storage**: Local file system or cloud storage for resume files

### Frontend Requirements
- **Framework**: React, Vue.js, or Svelte
- **UI Components**: Modern, clean interface with drag-and-drop functionality
- **Real-time updates**: Show tailoring progress and suggestions
- **Preview system**: Side-by-side comparison of original vs. tailored resume
- **Export options**: PDF, DOCX, and plain text formats

### Ollama Integration Specifications
```python
# Example Ollama API integration
import requests

def tailor_resume(resume_text, job_description, model="llama3.1"):
    prompt = f"""
    You are an expert resume writer and career coach. Tailor the following resume to match the job description provided.

    RESUME:
    {resume_text}

    JOB DESCRIPTION:
    {job_description}

    INSTRUCTIONS:
    1. Analyze the job description for key requirements, skills, and keywords
    2. Modify the resume to emphasize relevant experience and skills
    3. Add missing keywords naturally where appropriate
    4. Reorder sections to highlight most relevant qualifications first
    5. Quantify achievements with specific metrics when possible
    6. Ensure ATS-friendly formatting
    7. Keep the same factual information - don't fabricate experience

    Return the tailored resume in the same format as the original.
    """
    
    response = requests.post('http://localhost:11434/api/generate', 
                           json={
                               'model': model,
                               'prompt': prompt,
                               'stream': False
                           })
    return response.json()['response']
```

## Key Features to Implement

### 1. Smart Resume Analysis
- Parse and extract structured data from resumes
- Identify sections (summary, experience, skills, education)
- Analyze current keyword density and ATS compatibility

### 2. Job Matching Algorithm
- Extract key requirements from job descriptions
- Calculate compatibility scores between resume and job
- Identify gaps and improvement opportunities

### 3. Tailoring Engine
- **Dynamic content adjustment**: Modify bullet points and descriptions
- **Keyword integration**: Naturally incorporate missing keywords
- **Skill prioritization**: Reorder skills based on job requirements
- **Summary optimization**: Rewrite professional summary for each job

### 4. ATS Optimization
- Ensure proper heading structures
- Optimize keyword density (2-3% target)
- Check for ATS-unfriendly elements (tables, graphics, unusual fonts)
- Validate file format compatibility

### 5. Quality Assurance
- Grammar and spell checking
- Consistency validation
- Length optimization (1-2 pages recommendation)
- Professional tone maintenance

## User Interface Design

### Dashboard Layout
- **Upload Area**: Prominent resume upload section
- **Job Description Input**: Large text area with formatting options
- **Progress Indicator**: Show tailoring process stages
- **Results Panel**: Side-by-side original vs. tailored comparison

### Workflow Steps
1. **Welcome Screen**: Upload resume or start from scratch
2. **Resume Review**: Display parsed resume data for verification
3. **Job Input**: Paste or import job description
4. **Analysis**: Show compatibility score and identified gaps
5. **Tailoring**: Real-time AI processing with progress updates
6. **Review**: Present tailored resume with highlighted changes
7. **Export**: Download in preferred format

## Advanced Features

### 1. Multi-Job Management
- Save multiple tailored versions
- Track application status
- Compare different tailoring approaches

### 2. Analytics Dashboard
- Application success rates
- Keyword effectiveness tracking
- Interview conversion metrics

### 3. Template Library
- Industry-specific resume templates
- ATS-optimized layouts
- Customizable styling options

### 4. Batch Processing
- Tailor one resume for multiple jobs
- Bulk export functionality
- Queue management for large batches

## Performance Requirements

### Ollama Optimization
- **Model Selection**: Balance between capability and speed
- **Context Management**: Efficient prompt engineering for better results
- **Caching**: Store common tailoring patterns
- **Streaming**: Real-time response updates for better UX

### Response Times
- Resume parsing: < 5 seconds
- Job analysis: < 3 seconds
- Tailoring generation: < 30 seconds
- Export processing: < 10 seconds

## Security & Privacy

### Data Protection
- Local processing ensures resume privacy
- No cloud storage of sensitive data
- User consent for any data retention
- Secure file handling and cleanup

### Access Control
- User authentication system
- Session management
- Rate limiting for API calls

## Testing Strategy

### Unit Tests
- Resume parsing accuracy
- Job description analysis
- Keyword extraction algorithms
- Export functionality

### Integration Tests
- Ollama API communication
- End-to-end tailoring workflow
- File upload/download processes

### User Testing
- Interface usability
- Tailoring quality assessment
- Performance benchmarking

## Deployment Options

### Local Installation
- Docker containerization
- One-click installer for non-technical users
- Offline capability

### Self-Hosted
- Web server deployment
- Multi-user support
- Administration dashboard

## Success Metrics

### Quality Indicators
- ATS compatibility score improvement
- Keyword match percentage increase
- User satisfaction ratings
- Interview conversion rates

### Performance Metrics
- Processing time optimization
- System resource usage
- Error rates and reliability

## Development Phases

### Phase 1: MVP (4-6 weeks)
- Basic resume upload and parsing
- Simple job description input
- Basic Ollama integration for tailoring
- Export to PDF

### Phase 2: Enhancement (3-4 weeks)
- Advanced ATS optimization
- Improved UI/UX
- Multiple export formats
- Basic analytics

### Phase 3: Advanced Features (4-5 weeks)
- Multi-job management
- Template library
- Batch processing
- Performance optimization

This comprehensive prompt provides the foundation for building a professional resume tailoring application using Ollama that rivals commercial solutions while maintaining user privacy through local processing.