---
name: implementation-design
description: "프로젝트 진행 단계에서 구현 설계를 수행하는 메인 스킬. Sequence와 Flowchart를 중심으로 US 단위 구현 구조를 명확히 정의하고, 필요 시 C4 Container를 보조로 사용한다."
---

# Implementation Design

## 목적
`1h-vN.md`에서 정의된 US를 실제 구현 가능한 상세 설계로 변환한다.

핵심 원칙:
- 구현 전에 설계 증적을 남긴다.
- Sequence와 Flowchart를 기본 세트로 작성한다.
- C4 Container는 외부 의존성이 복잡할 때만 선택적으로 작성한다.
- US 단위로 설계를 분리해 변경 비용을 줄인다.

## 이 스킬이 메인으로 담당하는 것
- 구현 범위/경계 명확화
- Sequence 다이어그램 작성 (필수)
- Flowchart 작성
- C4 Container 작성 (선택)
- 구현 실행 스킬로 전달 가능한 설계 산출물 생성

## 입력
- `problems/[문제명]/1h-vN.md`
- `.agile/sprints/sprint-N/plan.md` (있다면)
- `problems/[문제명]/tech-stack.md` (있다면 우선 사용)

## 출력물
- `problems/[문제명]/implementation-design-vN.md`
- `problems/[문제명]/tech-stack.md` (없으면 생성)

템플릿:
- `templates/implementation-design-vN.md`
- `templates/tech-stack.md`

참고 문서:
- `references/philosophy.md`
- `references/diagram-guidelines.md`

## 작동 방식

### 1단계. 기술 스택 확인
- `problems/[문제명]/tech-stack.md` 존재 여부 확인
- 파일이 있으면: "기존 기술 스택 문서를 그대로 사용할지" 사용자에게 확인
- 파일이 없으면: 사용자에게 기술 스택 입력을 받고 `templates/tech-stack.md` 형식으로 저장
- 저장 경로: `problems/[문제명]/tech-stack.md`
- 확정된 스택을 `implementation-design-vN.md`에 링크

기술 스택 입력 수집 항목:
- 언어/런타임 버전
- 서버/클라이언트 프레임워크
- DB/캐시/메시징
- 인프라/배포/CI
- 테스트 스택
- `선택 이유`, `제약/주의사항`은 별도 질문 없이 AI가 문맥 기반으로 추론 작성

### 2단계. 대상 US 선택
- 이번 스프린트에서 구현할 US를 1~2개 선택
- US별 설계 범위를 명시

### 3단계. 구현 경계 정의
- In Scope / Out of Scope 확정
- 인터페이스(입력/출력/이벤트) 정의

### 4단계. C4 Container 판단 게이트
구현 경계 정의 직후, C4 Container 작성 여부를 먼저 결정한다.
- AI 추천: 생성 권장 | 생략 권장
- 추천 근거: 1줄
- 사용자 선택: 생성 | 생략

게이트 결과:
- `생성`: C4 Container 작성
  - 시스템 경계와 외부 의존성 명시
  - 컨테이너 간 책임과 통신 경로 정리
- `생략`: 다음 단계로 이동

### 5단계. Sequence 작성
- 핵심 시나리오 1~2개의 호출 순서 정의
- 예외/실패 흐름 포함

### 6단계. Flowchart 작성
- 상태 전이/분기 로직을 절차로 시각화

### 7단계. 구현 전달 정보 확정
- 구현 우선순위
- 테스트 포인트
- 리스크 및 완화 전략

## 안티패턴
- 코드 작성 후 다이어그램을 사후 생성
- Sequence 없이 API만 나열
- 실패 흐름을 생략
- 기술 스택 합의 없이 구현 설계를 진행

## 완료 조건
- `tech-stack.md` 확인/확정 완료
- 파일이 없던 경우 사용자 입력 기반으로 `tech-stack.md` 생성/저장 완료
- `implementation-design-vN.md` 작성 완료
- Sequence/Flowchart 포함
- C4 Container 게이트 기록 완료 (AI 추천 + 사용자 선택)
- C4 Container를 생성했다면 책임/경계가 명확해야 함
- US별 구현 경계와 테스트 포인트 명시
- `implementation-exec`가 바로 착수 가능한 전달 정보 포함

## 다음 단계
- `/implementation-exec` 실행
