# problem-solving-skills

이 저장소는 Claude Code, Codex, Gemini CLI의 skills를 활용해 문제를 **애자일 방식으로 직접 해결**하는 프로젝트입니다.

핵심 목적은 `How`부터 시작해서 방향을 잃는 문제를 줄이는 것입니다. 먼저 `What/Why`를 명확히 정리하고, 그 다음 `How`를 설계하면 목표가 흔들리지 않고 범위 이탈을 줄일 수 있습니다.

## 문제 해결 접근 방식
1. `What/Why` 정리 (`2w-brainstorm`)
- 무엇을 해결하는지, 왜 지금 해야 하는지 먼저 정의
- 모호한 요구를 명확한 문제로 전환

2. `How` 구조화 (`1h-agile-phase`)
- Mermaid 다이어그램으로 범위 시각화
- Phase 단위로 실행 순서와 기준 정의

3. 애자일 Sprint 실행 (`sprint-start`)
- 설계된 Phase를 실제 Sprint로 변환
- `sprint-status`, `sprint-complete`, `us-complete`로 진행/완료 관리

## 디렉터리 구조
- `.claude/skills/`: Claude Code 스킬 (`<skill>/SKILL.md`)
- `.codex/skills/`: Codex 스킬 (`<skill>/SKILL.md`)
- `.gemini/skills/`: Gemini 스킬 (`<skill>/SKILL.md`)
- `.gemini/commands/`: Gemini 커스텀 커맨드 (`*.toml`)
- `templates/`: 공통 템플릿 (예: `questions.md`)
- `scripts/sync-skills.sh`: 기존 작업공간 스킬 동기화 스크립트

## 포함 스킬
- `2w-brainstorm`: What/Why 중심 문제 정의
- `1h-agile-phase`: 범위 다이어그램 + Phase 구조화
- `sprint-start`: Phase 기반 Sprint 시작
- `sprint-status`: Sprint 진행 상태 점검
- `sprint-complete`: Sprint 완료 및 회고 정리
- `us-complete`: User Story 완료 요약

## 도구별 사용
- Claude Code: `.claude/skills`의 스킬 이름으로 호출
- Codex: `.codex/skills`의 스킬 이름으로 호출
- Gemini CLI: `.gemini/commands`의 커맨드 이름으로 실행

## 동기화
기존 환경의 스킬을 현재 저장소로 가져올 때 사용합니다.

```bash
cd problem-solving-skills
scripts/sync-skills.sh --dry-run
scripts/sync-skills.sh
```

주요 옵션:
- `--source-repo <path>` (기본: `../problem-solving`)
- `--source-codex <path>`
- `--include-codex-system`
- `--target-root <path>`
