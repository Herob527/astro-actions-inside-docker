FROM oven/bun:1.2.22-slim AS base
WORKDIR /app
COPY package.json bun.lock /app/
RUN --mount=type=cache,target=/root/.bun/install/cache \
  bun install --frozen-lockfile

FROM base AS assets
COPY . /app

FROM assets AS lint
CMD ["bun", "run", "lint"]

FROM assets AS dev
EXPOSE 4321
CMD ["bun", "run", "dev"]

FROM assets AS prod
RUN bun run build
EXPOSE 4321
CMD ["node", "./dist/server/entry.mjs"]
