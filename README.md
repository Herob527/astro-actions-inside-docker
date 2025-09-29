# Astro inside docker issue reproduction

## Issue

When using astro actions inside docker,
type generator uses absolute path to action files to infer types.

While this works while in local development,
it doesn't work exactly, when using docker since it has own file structure. 


## Reproduction steps

- Run `docker compose up --watch`
- Modify action
- Check .astro/actions.d.ts
- There will be path to actions in Docker container that I cannot utilise

[Link to issue](https://github.com/withastro/astro/issues/14453)
