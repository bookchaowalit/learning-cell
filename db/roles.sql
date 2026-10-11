-- Roles for the learning database. Locally a superuser runs this; on Neon
-- `learning-db provision` creates the same roles through the migrator.
--
-- learning_migrator  owns the schema and runs migrations only.
-- learning_api       the API at runtime: no superuser, no BYPASSRLS, owns nothing.
-- learning_publisher sweeps and marks the outbox across workspaces; nothing else.

DO $$
BEGIN
    IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = 'learning_migrator') THEN
        CREATE ROLE learning_migrator LOGIN NOSUPERUSER NOCREATEROLE NOBYPASSRLS;
    END IF;
    IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = 'learning_api') THEN
        CREATE ROLE learning_api LOGIN NOSUPERUSER NOCREATEDB NOCREATEROLE NOBYPASSRLS NOINHERIT;
    END IF;
    IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = 'learning_publisher') THEN
        CREATE ROLE learning_publisher LOGIN NOSUPERUSER NOCREATEDB NOCREATEROLE NOBYPASSRLS NOINHERIT;
    END IF;
END
$$;
