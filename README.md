# problem-solving-skills

이 저장소는 Claude Code, Codex, Gemini CLI의 skills를 활용해 문제를 **애자일 방식으로 직접 해결**하는 프로젝트입니다.

핵심 목적은 `How`부터 시작해서 방향을 잃는 문제를 줄이는 것입니다. 먼저 `What/Why`를 명확히 정리하고, 그 다음 `How`를 설계하면 목표가 흔들리지 않고 범위 이탈을 줄일 수 있습니다.

## 문제 해결 접근 방식 (Codex 권장)
1. `define-2w`: 사용자 입력(주로 How)에서 What/Why를 역추출해 2W를 정의
2. `design-phase-us`: 2W를 기반으로 Phase+US/범위/지표 설계
3. `plan-sprint`: 이번 Sprint의 US/Step 계획 확정
4. `design-implementation`: 구현 설계(Sequence/Flowchart, C4 Container 선택)
5. `execute-implementation`: 코드 구현 + 검증 + 실행 문서화
6. `design-test`: 테스트 설계(정상/실패/엣지, 우선순위)
7. `execute-test`: 테스트 구현/실행/실패 분석
8. `monitor-sprint`: Sprint 진행 상태 시각화/점검

## 디렉터리 구조
- `.claude/skills/`: Claude Code 스킬 (`<skill>/SKILL.md`)
- `.codex/skills/`: Codex 스킬 (`<skill>/SKILL.md`)
- `.gemini/skills/`: Gemini 스킬 (`<skill>/SKILL.md`)
- `.gemini/commands/`: Gemini 커스텀 커맨드 (`*.toml`)
- `templates/`: 공통 템플릿 (예: `questions.md`)
- `scripts/sync-skills.sh`: 기존 작업공간 스킬 동기화 스크립트

## 포함 스킬
- 메인 워크플로우: `define-2w`, `design-phase-us`, `plan-sprint`, `design-implementation`, `execute-implementation`, `design-test`, `execute-test`, `monitor-sprint`
- 보조/호환: `sprint-start`, `sprint-complete`, `us-complete`, `2w-brainstorm`, `1h-agile-phase`, `adr`, `agent-skill-sync`

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
