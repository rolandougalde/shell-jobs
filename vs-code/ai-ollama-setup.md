# Continue extension
**config.yaml**
```yaml
name: My Config
version: 0.0.1
schema: v1

models:
  - name: Gemma 4
    provider: ollama
    model: gemma4:e2b
    apiBase: http://localhost:11434
    roles:      
      - autocomplete
      - chat

tabAutocompleteModel:
  name: Gemma 4
  provider: ollama
  model: gemma4:e2b
  apiBase: http://localhost:11434
```
