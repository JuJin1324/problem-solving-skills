# Repository Guidelines

## Project Structure & Module Organization
This repository is a documentation-first workspace for a 5-week job-prep roadmap.
- Root docs: `GEMINI.md`, `CLAUDE.md`, `docs/skill-ops/framework.md`, `docs/skill-ops/principles.md` define goals, workflow, and scope.
- Planning data: `.agile/` stores sprint state and artifacts.
- Resume content: `resume/` is the main working area.
- Source inputs: `resume/research/input-sources/` holds raw materials (project notes, profile exports).
- Job targets: `resume/research/jd/` contains job-description analyses.
- Final outputs: `resume/applications/<company>/` contains company-specific resume variants.
- Reusable formats: `resume/templates/` stores template files.

## Build, Test, and Development Commands
There is no compile/build pipeline in this repo. Use lightweight validation commands:
- `rg --files` : list tracked content files quickly.
- `rg -n "TODO|FIXME|TBD" resume/` : find unfinished sections.
- `git diff --name-only` : verify intended file scope before commit.
- `git log --oneline -n 10` : check recent commit style before writing messages.

## Coding Style & Naming Conventions
- Author in Markdown (`.md`) with clear headings and short sections.
- Use sentence-style bullets and keep lines readable (prefer concise paragraphs).
- File naming pattern is lowercase kebab-case (example: `company-scoring.md`).
- Company-specific outputs should follow `<company>-resume.md` in `resume/applications/<company>/`.

## Testing Guidelines
No automated test framework is configured. Validation is editorial:
- Confirm internal links and paths are correct.
- Ensure each customized resume is consistent with `resume/core/core-resume.md`.
- Cross-check JD keyword mapping against `resume/strategy/keyword-mapping.md` before finalizing.

## Commit & Pull Request Guidelines
Recent history favors scoped, descriptive commits such as:
- `US-2.1: 코어 이력서(SSOT) 생성 완료`
- `Update: Sprint 2 계획 조정 ...`
- `Add: define-2w 워크플로우 정리 ...`

Follow this convention:
- Prefix with `US-x.y:`, `Update:`, `Add:`, or `Fix:`.
- Keep one logical change per commit.
- PRs should include: objective, changed files, before/after impact, and related sprint/US reference.

## Agent-Specific Notes
Before major edits, review `docs/skill-ops/framework.md` for scope and phase alignment, and keep sprint artifacts in `.agile/` synchronized with document updates.
