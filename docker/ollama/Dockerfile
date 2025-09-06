FROM ollama/ollama:latest

# Pre-download recommended models for resume tailoring
RUN ollama serve &amp; \
    sleep 10 &amp;&amp; \
    ollama pull llama3.1 &amp;&amp; \
    ollama pull mistral &amp;&amp; \
    pkill ollama

# Expose the default Ollama port
EXPOSE 11434

# Start Ollama server
CMD ["ollama", "serve"]