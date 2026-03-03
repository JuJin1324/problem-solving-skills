---
name: agile-loop-1h
description: "2W/Backlog vN을 기반으로 How를 범위/US/지표로 구조화하는 메인 스킬. 1페이즈(스프린트) 단위 설계에 집중해 실행 가능한 계획으로 만든다."
---

# Agile Loop 1H

## 목적
범위 중심 통제를 통해 설계를 **1페이즈(스프린트) 분량**으로 제한한다.

핵심 원칙:
- 범위(Scope) 우선: 포함/제외/미확정 명시
- 1페이즈 안에서 US(User Story)로 실행 단위를 쪼갠다
- 각 US는 Step 단위 작업으로 쪼갠다
- 지표는 최소 2개: 선행 지표(Leading) 1, 결과 지표(Outcome) 1

## 이 스킬이 메인으로 담당하는 것
- 2W 기반 How 구조화
- 범위 확정(In/Out/Unknown)
- US > Step 계획 + Sprint 핸드오프

## 입력
- `problems/[문제명]/2w-vN.md`
- `problems/[문제명]/backlog-vN.md`

## 출력물
- `problems/[문제명]/1h-vN.md`

템플릿:
- `templates/1h-vN.md`

참고 문서:
- `references/philosophy.md`
  - 왜 1H를 1페이즈(스프린트) 분량으로 제한하는지 확인할 때
  - 범위/US/Step/지표 최소화 원칙이 필요할 때

## 작동 방식

### 1단계. 2W/Backlog 요약 반영
2W와 Backlog에서 다음만 가져온다.
- 무엇/왜
- 제약 조건
- 성공 기준/경계
- MVP-0 컷라인(In/Later/Unknown)

### 2단계. 범위 확정
`포함(In)/제외(Out)/미확정(Unknown)`으로 분리:
- 포함(In): `backlog-vN.md`의 MVP-0 In 중 이번 스프린트에서 설계할 것 1~3개
- 제외(Out): 명시적으로 제외할 것 1~3개
- 미확정(Unknown): 실행 후 판단할 것 1~2개

### 3단계. US/지표 설정
- US는 1~2개만 설정
- 각 US에 Step을 1~3개 설정
- 선행 지표(Leading) 1개
- 결과 지표(Outcome) 1개

### 4단계. 스프린트 전달 정보 확정
다음 실행 단계에서 바로 계획을 만들 수 있게 아래를 확정:
- 스프린트 목표(Sprint Goal)
- 완료 기준(Definition of Done)
- 선행 의존사항

## 안티패턴
- Out/Unknown을 비워 Scope가 커짐
- Backlog 컷라인 없이 1H를 먼저 작성함
- 멀티 스프린트 상세 계획을 여기서 확정

## 완료 조건
- `1h-vN.md` 작성 완료
- `backlog-vN.md` 컷라인 반영 완료
- 포함/제외/미확정 확정
- US/Step 구조 + 지표 2개 확정
- 스프린트 목표/완료 기준 명시

## 다음 단계
- `/agile-loop-sprint` 실행
