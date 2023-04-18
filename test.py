from transformers import AutoModelForCausalLM, AutoTokenizer
import torch

model = AutoModelForCausalLM.from_pretrained("facebook/opt-13b", torch_dtype=torch.float32).cpu()

# the fast tokenizer currently does not work correctly
tokenizer = AutoTokenizer.from_pretrained("facebook/opt-13b", use_fast=False)

prompt = "Hello, I'm am conscious and"


input_ids = tokenizer(prompt, return_tensors="pt").input_ids.cpu()

generated_ids = model.generate(input_ids)

tokens = tokenizer.batch_decode(generated_ids, skip_special_tokens=True)
print(tokens)

