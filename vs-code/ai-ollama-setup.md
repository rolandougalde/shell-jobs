# Continue extension config

```yaml
name: My Config
version: 0.0.1
schema: v1

models:
  - name: gemma4:e4b
    model: gemma4:e4b
    provider: ollama 
    apiBase: http://localhost:11434
    roles:      
      - chat
      - autocomplete
      - edit
      - apply
      - rerank   
  - name: qwen3.5:4b
    model: qwen3.5:4b
    provider: ollama
    apiBase: http://localhost:11434
    roles:      
      - chat
      - autocomplete
      - edit
      - apply
      - rerank
  - name: nemotron-3-nano:4b
    model: nemotron-3-nano:4b
    provider: ollama
    apiBase: http://localhost:11434
    roles:      
      - chat
      - autocomplete
      - edit
      - apply
      - rerank

# --- Added Configuration for Edit, Apply, and Rerank ---
editModel:

applyModel:

# Note: Ollama doesn't natively support traditional reranking models (like Cohere).
# If you want to use your Ollama LLM as a reranker, define it like this:
rerankModel:
```
