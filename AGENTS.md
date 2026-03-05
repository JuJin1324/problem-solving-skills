# AGENTS.md

이 프로젝트는 Codex skills를 활용해 문제를 애자일 방식으로 해결하는 실행형 워크스페이스입니다.

## 핵심 원칙
1. `What/Why` 없이 바로 구현(`How`)으로 들어가지 않는다.
2. 설계는 범위(다이어그램)와 Phase로 분리한다.
3. 실행은 Sprint 단위로 관리한다.

## 권장 흐름
1. `define-2w`: 사용자 입력에서 What/Why를 역추출해 방향 확정
2. `design-phase`: Phase+US/범위/지표 설계
3. `monitor-sprint`: Sprint 상태 문서 초기화/대시보드 점검
4. `design-implementation`: 구현 설계 산출물 작성
5. `execute-implementation`: 코드 구현/검증/문서화
6. `design-test`: 테스트 설계
7. `execute-test`: 테스트 구현/실행/분석
8. `monitor-sprint`: 진행 상황 갱신/재평가
9. `review-sprint`: Sprint 회고 및 다음 스프린트 시작/종료 판단

## Codex Skill Location
- Codex 스킬 경로: `.codex/skills/<skill-name>/SKILL.md`
- 레거시 Codex 스킬 경로: `.codex/skills-legacy/<skill-name>/SKILL.md` (기본 미사용)
- 스킬 결과는 문서(`*.md`) 중심으로 남기고, Sprint 산출물은 `.agile/sprints/sprint-N/{1-direction,2-delivery,3-learning}/`에 기록한다.
