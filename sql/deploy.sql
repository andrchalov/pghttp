--
-- PostgreSQL utility functions for HTTP requests
--
-- Deployment entrypoint
--

\set ON_ERROR_STOP

\set pgver_schema :pgver_schema
SELECT CASE WHEN :'pgver_schema'=':pgver_schema' THEN 'http' ELSE :'pgver_schema' END AS "pgver_schema" \gset

\ir pgver.sql
