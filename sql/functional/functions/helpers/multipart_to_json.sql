
-------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION :"pgver_schema".multipart_to_json(
  body text, content_type text
)
  RETURNS json
  LANGUAGE plpython3u
AS $function$
import json
import requests
import cgi
from requests_toolbelt.multipart.decoder import MultipartDecoder

decoder = MultipartDecoder(body, content_type)

result = {}
for part in decoder.parts:
  value, params = cgi.parse_header(part.headers['Content-Disposition'])
  result[params['name']] = part.text

return json.dumps(result)
$function$;
-------------------------------------------------------------------------------
