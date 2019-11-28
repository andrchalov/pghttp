
-------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION :"pgver_schema".request(
  method text,
  url text,
  data text,
  params text[] DEFAULT NULL,
  headers text[] DEFAULT NULL,
  cookies text[] DEFAULT NULL,
  timeout int DEFAULT 10,
  allow_redirects boolean DEFAULT true,
  verify boolean DEFAULT true,
  raise_for_status boolean DEFAULT true
)
  RETURNS :"pgver_schema".response
  LANGUAGE plpython3u
AS $function$
import requests
import json

p = dict(params) if params else None
h = dict(headers) if headers else None
c = dict(cookies) if cookies else None

try:
  r = requests.request(
    method, url, data=data, params=p, headers=h, cookies=c, timeout=timeout,
    allow_redirects=allow_redirects, verify=verify
  )

  if raise_for_status:
    r.raise_for_status()

  return (json.dumps(dict(r.cookies)), json.dumps(dict(r.headers)), r.status_code, r.text)
except requests.exceptions.HTTPError as e:
  plpy.error(e, detail=r.text)
$function$;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION :"pgver_schema".request(
  method text,
  url text,
  data json,
  params text[] DEFAULT NULL,
  headers text[] DEFAULT NULL,
  cookies text[] DEFAULT NULL,
  timeout int DEFAULT 10,
  allow_redirects boolean DEFAULT true,
  verify boolean DEFAULT true,
  raise_for_status boolean DEFAULT true
)
  RETURNS :"pgver_schema".response
  LANGUAGE plpython3u
AS $function$
import requests
import json

h = {'Content-type': 'application/json'}
h.update(dict(headers)) if headers else None

p = dict(params) if params else None
c = dict(cookies) if cookies else None

try:
  r = requests.request(
    method, url, data=data, params=p, headers=h, cookies=c, timeout=timeout,
    allow_redirects=allow_redirects, verify=verify
  )

  if raise_for_status:
    r.raise_for_status()

  return (json.dumps(dict(r.cookies)), json.dumps(dict(r.headers)), r.status_code, r.text)
except requests.exceptions.HTTPError as e:
  plpy.error(e, detail=r.text)
$function$;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION :"pgver_schema".request(
  method text,
  url text,
  data text[],
  params text[] DEFAULT NULL,
  headers text[] DEFAULT NULL,
  cookies text[] DEFAULT NULL,
  timeout int DEFAULT 10,
  allow_redirects boolean DEFAULT true,
  verify boolean DEFAULT true,
  raise_for_status boolean DEFAULT true
)
  RETURNS :"pgver_schema".response
  LANGUAGE plpython3u
AS $function$
import requests
import json

p = dict(params) if params else None
h = dict(headers) if headers else None
c = dict(cookies) if cookies else None

try:
  r = requests.request(
    method, url, data=data, params=p, headers=h, cookies=c, timeout=timeout,
    allow_redirects=allow_redirects, verify=verify
  )

  if raise_for_status:
    r.raise_for_status()

  return (json.dumps(dict(r.cookies)), json.dumps(dict(r.headers)), r.status_code, r.text)
except requests.exceptions.HTTPError as e:
  plpy.error(e, detail=r.text)
$function$;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION :"pgver_schema".request(
  method text,
  url text,
  params text[] DEFAULT NULL,
  headers text[] DEFAULT NULL,
  cookies text[] DEFAULT NULL,
  timeout int DEFAULT 10,
  allow_redirects boolean DEFAULT true,
  verify boolean DEFAULT true,
  raise_for_status boolean DEFAULT true
)
  RETURNS :"pgver_schema".response
  LANGUAGE plpython3u
AS $function$
import requests
import json

p = dict(params) if params else None
h = dict(headers) if headers else None
c = dict(cookies) if cookies else None

try:
  r = requests.request(
    method, url, params=p, headers=h, cookies=c, timeout=timeout,
    allow_redirects=allow_redirects, verify=verify
  )

  if raise_for_status:
    r.raise_for_status()

  return (json.dumps(dict(r.cookies)), json.dumps(dict(r.headers)), r.status_code, r.text)
except requests.exceptions.HTTPError as e:
  plpy.error(e, detail=r.text)
$function$;
-------------------------------------------------------------------------------
