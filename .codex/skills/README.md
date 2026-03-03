# Codex Skills

이 디렉터리는 Codex용 프로젝트 스킬 모음입니다.

## Skills

- `define-2w`: 4개 필수 질문으로 2W를 라운드(vN) 단위로 빠르게 정의
- `design-phase-us`: 2W vN 기반으로 1페이즈 분량의 Phase+US/지표/완료조건을 설계 (Step은 Sprint에서 작성)
- `plan-sprint`: Sprint 계획/진행/완료/US 완료를 통합 운영하고 다음 2W/Phase-US 라운드로 반영
- `design-implementation`: 구현 설계 전용 스킬 (Sequence/Flowchart 중심 + C4 Container 선택)
- `execute-implementation`: 구현 실행 전용 스킬 (코드 스타일 컨벤션 + 테스트/검증)
- `design-test`: 테스트 구현 설계 전용 스킬 (케이스/우선순위/전략/환경)
- `execute-test`: 테스트 구현 실행 전용 스킬 (실행/실패분석/재검증)
- `monitor-sprint`: Sprint 진행 현황 집계
- `sprint-start`: 기존 Sprint 시작 스킬 (호환 유지)
- `sprint-complete`: Sprint 회고/완료 정리
- `us-complete`: US 완료 요약 및 커밋 가이드
- `2w-brainstorm`: 기존 What/Why 문제 정의 스킬 (호환 유지)
- `1h-agile-phase`: 기존 How 다이어그램/Phase/지표 설계 스킬 (호환 유지)
- `adr`: Architecture Decision Record 생성/관리
- `agent-skill-sync`: 다른 에이전트 스킬을 Codex 형식으로 동기화

## 형식 규칙

- `SKILL.md` frontmatter는 Codex 형식을 사용합니다.
- 필수 메타 필드:
  - `name`
  - `description`
- UI 노출 정보가 필요하면 `agents/openai.yaml`을 함께 관리합니다.

## 동기화 메모

- 공통 스킬 업데이트 시 `.claude/skills`, `.gemini/skills`와 함께 동기화합니다.
- 대량 동기화는 `agent-skill-sync` 스킬의 스크립트를 사용합니다.
