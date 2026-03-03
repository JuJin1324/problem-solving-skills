---
name: agile-loop-sprint
description: "Sprint 계획/진행/완료를 한 흐름으로 운영하는 메인 스킬. 실행-검증-학습 루프로 Sprint 결과를 2W/1H 다음 버전에 반영한다."
---

# Agile Loop Sprint

## 목적
Sprint를 계획하고 실행/점검/완료까지 운영한 뒤, 결과를 다음 `2W vN+1 / 1H vN+1`에 반영하는 **학습 루프**를 강제한다.

핵심 원칙:
- 계획은 실행을 위한 가설
- Sprint 결과는 다음 계획의 입력
- 회고 없는 반복은 금지

## 이 스킬이 메인으로 담당하는 것
- Sprint 계획 수립 (Plan)
- Sprint 진행 점검 (Status)
- US 회고 기록 (US Retrospective)
- Sprint 회고 작성 (Loop Review)
- 증적 기반 회고(가정 검증/반박)
- 다음 라운드 진입 판단

## 입력
- `problems/[문제명]/1h-vN.md`

## 출력물
- `.agile/sprints/sprint-N/plan.md`
- `.agile/sprints/sprint-N/status.md`
- `.agile/sprints/sprint-N/us-N.M-retrospective.md`
- `.agile/sprints/sprint-N/loop-review-vN.md` (스프린트 회고 본문)

템플릿:
- `templates/loop-review-vN.md`
- `templates/sprint-plan.md`
- `templates/status.md`
- `templates/us-retrospective.md`

참고 문서:
- `references/philosophy.md`
  - 왜 매 스프린트 종료 후 2W/1H 재진입이 필요한지 확인할 때
  - 실행-학습 루프 운영 원칙을 팀에 설명할 때

## 권장 실행 순서
1. Plan: `1h-vN.md` 기반으로 `plan.md` 생성/확정
2. Execute: US > Step 단위로 실행
3. Status: 진행률과 일정 리스크를 `status.md`에 기록
4. US Retrospective: 각 US 완료 후 `us-N.M-retrospective.md` 작성
5. Sprint Retrospective: `loop-review-vN.md` 작성
6. 다음 라운드 결정

## 루프 리뷰 규칙
`loop-review-vN.md`는 스프린트 회고 문서이며, 아래 5개를 반드시 작성:
1. 검증된 가정 (True)
2. 반박된 가정 (False)
3. 새로 생긴 Unknown
4. 유지할 전략
5. 폐기할 전략

## 다음 라운드 결정 규칙
- 2W 자체가 바뀜: `/agile-loop-2w`로 재진입 (`2w-vN+1.md`)
- 2W는 유지, How만 수정: `/agile-loop-1h`로 재진입 (`1h-vN+1.md`)
- 목표 달성: 루프 종료

## 안티패턴
- 회고를 생략하고 다음 Sprint를 시작
- 실패한 가정을 문서에서 제거만 하고 원인 기록 없음
- 일정 지연을 숨기고 계획을 고정값처럼 취급

## 완료 조건 (Done)
- `plan.md`, `status.md` 작성 완료
- 완료된 US마다 `us-N.M-retrospective.md` 작성 완료
- `loop-review-vN.md`(스프린트 회고) 작성 완료
- 다음 라운드 진입 경로 확정

## 다음 단계
- 결정에 따라 `/agile-loop-2w` 또는 `/agile-loop-1h`
