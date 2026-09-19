# Ollama Continue Ext. Config.

.continue > config.yaml

```yaml
name: My Config
version: 0.0.1
schema: v1

models:
  - name: radenadri/Qwen3.5-0.8B-Claude-4.6-Opus-Reasoning-Distilled-GGUF
    model: radenadri/Qwen3.5-0.8B-Claude-4.6-Opus-Reasoning-Distilled-GGUF
    provider: ollama
    roles:      
      - autocomplete
      - chat
      - edit
      - apply
      - rerank    
  - name: gemma4:e4b
    model: gemma4:e4b
    provider: ollama    
  - name: qwen3.5:4b
    model: qwen3.5:4b
    provider: ollama
    apiBase: http://localhost:11434
    roles:      
      - autocomplete
      - chat
      - edit
      - apply
      - rerank

tabAutocompleteModel:
  name: gemma4:e4b
  provider: ollama
  model: gemma4:e4b
  apiBase: http://localhost:11434

# --- Added Configuration for Edit, Apply, and Rerank ---

editModel:
  name: gemma4:e4b
  provider: ollama
  model: gemma4:e4b
  apiBase: http://localhost:11434

applyModel:
  name: gemma4:e4b
  provider: ollama
  model: gemma4:e4b
  apiBase: http://localhost:11434

# Note: Ollama doesn't natively support traditional reranking models (like Cohere).
# If you want to use your Ollama LLM as a reranker, define it like this:
rerankModel:
  name: gemma4:e4b
```
