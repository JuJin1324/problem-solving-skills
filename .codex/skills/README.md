# Codex Skills

이 디렉터리는 Codex용 프로젝트 스킬 모음입니다.

## Skills

- `2w-brainstorm`: What/Why 문제 정의
- `1h-agile-phase`: How 다이어그램/Phase/지표 설계
- `sprint-start`: Sprint 계획 시작
- `sprint-status`: Sprint 진행 현황 집계
- `sprint-complete`: Sprint 회고/완료 정리
- `us-complete`: US 완료 요약 및 커밋 가이드
- `adr`: Architecture Decision Record 생성/관리
- `agent-skill-sync`: 다른 에이전트 스킬을 Codex 형식으로 동기화
- `agile-loop-2w`: 4개 필수 질문으로 2W를 라운드(vN) 단위로 빠르게 정의
- `agile-loop-backlog`: 2W와 1H 사이에서 백로그를 정제하고 MVP-0/MVP-1 컷라인을 확정
- `agile-loop-1h`: 2W/Backlog vN 기반으로 1스프린트 분량 How(다이어그램/Phase/지표) 설계
- `agile-loop-sprint`: Sprint 계획/진행/완료/US 완료를 통합 운영하고 다음 2W/Backlog/1H 라운드로 반영
- `implementation-design`: 구현 설계 전용 스킬 (Sequence/Flowchart 중심 + C4 Container 선택)
- `implementation-exec`: 구현 실행 전용 스킬 (코드 스타일 컨벤션 + 테스트/검증)
- `test-design`: 테스트 구현 설계 전용 스킬 (케이스/우선순위/전략/환경)
- `test-exec`: 테스트 구현 실행 전용 스킬 (실행/실패분석/재검증)

## 형식 규칙

- `SKILL.md` frontmatter는 Codex 형식을 사용합니다.
- 필수 메타 필드:
  - `name`
  - `description`
- UI 노출 정보가 필요하면 `agents/openai.yaml`을 함께 관리합니다.

## 동기화 메모

- 공통 스킬 업데이트 시 `.claude/skills`, `.gemini/skills`와 함께 동기화합니다.
- 대량 동기화는 `agent-skill-sync` 스킬의 스크립트를 사용합니다.
