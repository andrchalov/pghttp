
CREATE EXTENSION IF NOT EXISTS plpython3u;

--------------------------------------------------------------------------------
CREATE SCHEMA :"pgver_schema" AUTHORIZATION :"schema_owner";
--------------------------------------------------------------------------------

\ir types/response.sql
\ir functions/request.sql
\ir functions/generate.sql

\ir functions/helpers/multipart_to_json.sql
