/**
 * CC Extension Feature Flags
 * All flags are env-driven, default OFF, hot-readable (no restart).
 * Import: import { flags } from '@/extensions/feature-flags';
 */

function boolFlag(name: string): boolean {
  return process.env[name]?.toLowerCase() === 'true';
}

export const flags = {
  get preflight(): boolean { return boolFlag('CC_PREFLIGHT_ENABLED'); },
  get reactions(): boolean { return boolFlag('CC_REACTIONS_ENABLED'); },
  get tokenEconomy(): boolean { return boolFlag('CC_TOKEN_ECONOMY_ENABLED'); },
  get personaTraits(): boolean { return boolFlag('CC_PERSONA_TRAITS_ENABLED'); },
  get workspacePolicy(): boolean { return boolFlag('CC_WORKSPACE_POLICY_ENABLED'); },
};

export type FeatureFlags = typeof flags;
