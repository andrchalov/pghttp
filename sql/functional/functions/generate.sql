
--------------------------------------------------------------------------------
CREATE FUNCTION :"pgver_schema".generate(
  schema text, name text, method text, data_type text DEFAULT NULL
)
  RETURNS void
  LANGUAGE plpgsql
AS $function$
BEGIN
  EXECUTE $$
    CREATE FUNCTION $$||quote_ident(schema)||'.'||quote_ident(name)||$$(
      url text,
      $$||CASE WHEN data_type NOTNULL THEN 'data '||data_type||',' ELSE '' END||$$
      params text[] DEFAULT NULL,
      headers text[] DEFAULT NULL,
      cookies text[] DEFAULT NULL,
      timeout int DEFAULT 10,
      allow_redirects boolean DEFAULT true,
      verify boolean DEFAULT true,
      raise_for_status boolean DEFAULT true
    )
      RETURNS $$||quote_ident(schema)||$$.response
      LANGUAGE sql
    AS $func$
    SELECT $$||quote_ident(schema)||$$.request(
      $$||quote_literal(method)||$$,$1,$2,$3,$4,$5,$6,$7,$8
      $$||CASE WHEN data_type NOTNULL THEN ',$9' ELSE '' END||$$
    );
    $func$;
  $$;
END;
$function$;
--------------------------------------------------------------------------------

SELECT :"pgver_schema".generate(:'pgver_schema', 'post', 'POST', 'text[]');
SELECT :"pgver_schema".generate(:'pgver_schema', 'post', 'POST', 'text');
SELECT :"pgver_schema".generate(:'pgver_schema', 'post', 'POST', 'json');
SELECT :"pgver_schema".generate(:'pgver_schema', 'post', 'POST');
SELECT :"pgver_schema".generate(:'pgver_schema', 'put', 'PUT', 'text[]');
SELECT :"pgver_schema".generate(:'pgver_schema', 'put', 'PUT', 'text');
SELECT :"pgver_schema".generate(:'pgver_schema', 'put', 'PUT', 'json');
SELECT :"pgver_schema".generate(:'pgver_schema', 'put', 'PUT');
SELECT :"pgver_schema".generate(:'pgver_schema', 'get', 'GET');
SELECT :"pgver_schema".generate(:'pgver_schema', 'head', 'HEAD');
SELECT :"pgver_schema".generate(:'pgver_schema', 'options', 'OPTIONS');
SELECT :"pgver_schema".generate(:'pgver_schema', 'delete', 'DELETE', 'text[]');
SELECT :"pgver_schema".generate(:'pgver_schema', 'delete', 'DELETE', 'text');
SELECT :"pgver_schema".generate(:'pgver_schema', 'delete', 'DELETE', 'json');
SELECT :"pgver_schema".generate(:'pgver_schema', 'delete', 'DELETE');

DROP FUNCTION :"pgver_schema".generate(text,text,text,text);
