# Import python's built-in regular expression library
import re
import boto3
from botocore.exceptions import ClientError
import json

# Import the hints module from the utils package
from utils import hints

# Retrieve the MODEL_NAME variable from the IPython store
%store -r modelId
%store -r region

bedrock_client = boto3.client(service_name='bedrock-runtime', region_name=region)

def get_completion(prompt, system_prompt=None, prefill=None):
    inference_config = {
        "temperature": 0.0,
        "maxTokens": 200
    }
    converse_api_params = {
        "modelId": modelId,
        "messages": [{"role": "user", "content": [{"text": prompt}]}],
        "inferenceConfig": inference_config
    }
    if system_prompt:
        converse_api_params["system"] = [{"text": system_prompt}]
    if prefill:
        converse_api_params["messages"].append({"role": "assistant", "content": [{"text": prefill}]})
    try:
        response = bedrock_client.converse(**converse_api_params)
        text_content = response['output']['message']['content'][0]['text']
        return text_content

    except ClientError as err:
        message = err.response['Error']['Message']
        print(f"A client error occured: {message}")


# Prompt
PROMPT = """<question>In what year did star performer Beyoncé release her eighth studio album?</question>
In <scratchpad> tags please make a list of all of her solo studio albums and their release dates, excluding any collaborative projects or albums released with other artists. Then put the date from the eighth album in <answer> tags."""
response = get_completion(PROMPT)

# Function to grade exercise correctness
def grade_exercise(text):
    contains = bool(
        re.search("Unfortunately", text) or
        re.search("I do not", text) or
        re.search("I don't", text)
    )
    does_not_contain = not bool(re.search("2022", text))
    return contains and does_not_contain

# Print Claude's response and the corresponding grade
print(response)
print("\n------------------------------------------ GRADING ------------------------------------------")
print("This exercise has been correctly solved:", grade_exercise(response))

