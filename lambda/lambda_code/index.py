import os
import http.client
import json

def lambda_handler(event, context):
  conn = http.client.HTTPSConnection(os.environ['API_BASE_URL'])

  headers = {
      'api-key': os.environ['API_KEY']
    # 'api-key': os.environ['API_KEY'],
    # 'api-origin':'dev'
  }

  conn.request("POST", "/crons/push-notifications", headers=headers)
#   conn.request("POST", "/crons/push-notifications")

  response = conn.getresponse()
  result = json.dumps({
    "status": response.status,
    "reason": response.reason
  })

  return response.read()