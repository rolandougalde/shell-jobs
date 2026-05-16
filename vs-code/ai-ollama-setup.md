```yaml
name: My Config
version: 0.0.1
schema: v1

models:
  - name: cryptidbleh/gemma4-claude-sonnet-4.6:latest
    provider: ollama
    model: cryptidbleh/gemma4-claude-sonnet-4.6:latest
    apiBase: http://localhost:11434
    roles:      
      - autocomplete
      - chat

tabAutocompleteModel:
  name: cryptidbleh/gemma4-claude-sonnet-4.6:latest
  provider: ollama
  model: cryptidbleh/gemma4-claude-sonnet-4.6:latest
  apiBase: http://localhost:11434

# --- Added Configuration for Edit, Apply, and Rerank ---

editModel:
  name: cryptidbleh/gemma4-claude-sonnet-4.6:latest
  provider: ollama
  model: cryptidbleh/gemma4-claude-sonnet-4.6:latest
  apiBase: http://localhost:11434

applyModel:
  name: cryptidbleh/gemma4-claude-sonnet-4.6:latest
  provider: ollama
  model: cryptidbleh/gemma4-claude-sonnet-4.6:latest
  apiBase: http://localhost:11434

# Note: Ollama doesn't natively support traditional reranking models (like Cohere).
# If you want to use your Ollama LLM as a reranker, define it like this:
rerankModel:
  name: cryptidbleh/gemma4-claude-sonnet-4.6:latest
```
  provider: ollama
  model: cryptidbleh/gemma4-claude-sonnet-4.6:latest
  apiBase: http://localhost:11434
