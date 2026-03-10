-- CC Extension Schema (Phase 0 stubs)
-- Separate schema to avoid collisions with Paperclip core tables.
-- Columns are minimal stubs — populated in Phase 2 with real data.

CREATE SCHEMA IF NOT EXISTS cc_ext;
--> statement-breakpoint

CREATE TABLE cc_ext.persona_traits (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
  agent_id text NOT NULL,
  trait_name text NOT NULL,
  weight numeric(5,4) NOT NULL DEFAULT 0.5,
  updated_at timestamp with time zone DEFAULT now() NOT NULL,
  created_at timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE INDEX cc_ext_persona_traits_agent_idx ON cc_ext.persona_traits USING btree (agent_id);
--> statement-breakpoint

CREATE TABLE cc_ext.persona_snapshots (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
  agent_id text NOT NULL,
  snapshot_data jsonb NOT NULL DEFAULT '{}',
  created_at timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE INDEX cc_ext_persona_snapshots_agent_idx ON cc_ext.persona_snapshots USING btree (agent_id);
--> statement-breakpoint

CREATE TABLE cc_ext.preflight_log (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
  agent_id text NOT NULL,
  task_id text,
  result text NOT NULL DEFAULT 'pass',
  checks jsonb NOT NULL DEFAULT '{}',
  created_at timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE INDEX cc_ext_preflight_log_agent_idx ON cc_ext.preflight_log USING btree (agent_id);
--> statement-breakpoint

CREATE TABLE cc_ext.bridge_agent_persona (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
  agent_id text NOT NULL UNIQUE,
  persona_id text NOT NULL,
  created_at timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE INDEX cc_ext_bridge_agent_persona_agent_idx ON cc_ext.bridge_agent_persona USING btree (agent_id);
