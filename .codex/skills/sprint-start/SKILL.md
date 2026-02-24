---
name: sprint-start
description: "새로운 Sprint를 시작하고 계획을 생성합니다. 2w-brainstorm.md와 how-diagram.md(Phase)를 기반으로 Sprint Goal과 Tasks를 제안하고, 사용자 확정 후 공식 시작합니다."
---

# Sprint Start

## 목적

Sprint 단위로 프로젝트를 시작하며, 사용자가 주도권을 유지하도록 돕습니다.

**해결하는 문제:**
- ❌ Sprint 계획 없이 무작정 구현 시작 → 방향 상실
- ❌ AI에게 맡기면 → 주도성 상실
- ❌ 무엇을 해야 할지 매번 불명확

**제공하는 가치:**
- ✅ Sprint Goal 명확화 → 주도권 유지
- ✅ Task 구조화 → 진행 방향 명확
- ✅ 문서화 자동화 → 시간 절약

## 공통 출력 규칙 (Quick Guide + Intent/Review/Cleanup)

모든 계획 문서는 본문 앞에 30초 내 확인 가능한 `Quick Guide`를 포함합니다.

**Quick Guide 필수 구성 (최대 8줄):**
1. 문서 목적 1문장
2. 이번에 확인할 것 3가지 (범위, 우선순위, 실행 가능성)
3. 위험 신호 2가지 (예: 모호한 완료 조건, 과도한 태스크 분해)
4. 5분 리뷰 순서 3-step

**Intent/판단 근거 규칙:**
- US 또는 핵심 변경에는 `Intent`를 짧게 명시합니다.
- 필요 시 선택 이유를 1줄로 추가합니다.

**Review/Cleanup 규칙:**
1. 초안에는 Quick Guide와 Intent 설명을 포함해 리뷰를 요청합니다.
2. 리뷰 반영 후 최종본에서는 임시 해설 문구를 제거하거나 최소 요약만 남깁니다.
3. 최종 문서는 실행 본문과 증적 중심으로 정리합니다.
4. 결과물 이해 보조 목적의 Summary는 Quick Guide로 대체합니다.

---

## 파일 구조

```
.agile/
├── config.yml                  # 설정 (Sprint 기본 기간 등)
├── current-sprint.txt          # 현재 Sprint 번호
├── sprints/
│   ├── sprint-0/
│   │   ├── plan.md            # Sprint 계획 (확정본)
│   │   ├── step-0.1-log.md    # Step 0.1 증적 로그 (선택)
│   │   ├── step-0.2-log.md    # Step 0.2 증적 로그 (선택)
│   │   └── retrospective.md   # 회고 (완료 후)
│   ├── sprint-1/
│   └── ...
└── templates/
    ├── sprint-plan.md         # Sprint 계획 템플릿
    └── retrospective.md       # 회고 템플릿
```

---

## 프로젝트 진행 철학

### AI 시대 워크플로우: 시각화 → 검토 → 구현

**전통적 방식:**
- 구현 → 문서화 (사후)

**AI 시대:**
- **시각화 → 검토 → 구현** (사전)
- AI가 비용 없이 다이어그램 생성
- 잘못된 방향으로 구현 방지

### 핵심 원칙

1. **인지 부하 최소화**: 작은 단위로 반복 (US 단위)
2. **빠른 피드백 루프**: Checkpoint로 검증
3. **검증 후 구현**: 잘못된 방향 사전 차단
4. **의사결정 기록**: 아키텍처 고민 발생 시점에 ADR 작성
5. **범위 준수**: 실행 계획 기반 타임박싱
   - 🎯 **주 참조**: `how-diagram.md` (루트 또는 `docs/planning/`) - Phase/Sprint 실행 로드맵
   - 📚 **부 참조**: `2w-brainstorm.md` (루트 또는 `docs/planning/`) - 프로젝트 배경 컨텍스트 (What/Why)

### US(User Story) 기반 진행 구조

> **US = 가장 작은 반복 단위.** 리뷰하고 넘어가는 단위를 기준으로 작업을 설계한다.
> Sprint가 US를 직접 포함한다. (Sprint > US, 중간 계층 없음)

```
Sprint N
├── Sprint 시작: 프로젝트 방향 결정 (ADR 작성)
├── US-N.1: {목표}
│   ├── 1. 시각화 (다이어그램, 필요시 ADR)
│   ├── 2. 🔍 Checkpoint (사용자 검토 및 확정)
│   ├── 3. 구현
│   ├── 4. 검증
│   └── 5. 📄 Step 증적 로그 기록 (선택)
├── US-N.2: {목표}
│   └── ...
└── US-N.M: 통합 및 문서화
```

### Step Evidence Log 파일 (선택)

> Quick Guide가 문서 이해 보조를 담당하므로, 별도 요약 문서는 증적이 필요할 때만 작성합니다.

**파일 경로:** `.agile/sprints/sprint-N/step-N.M-log.md`

**생성 시점:** 특정 Step/US 종료 후 증적 보존이 필요한 경우

**포함 권장 내용 (증적 중심):**
1. 완료한 작업 목록
2. 생성/수정된 파일 목록 (경로 포함)
3. 주요 결정사항 및 트레이드오프
4. 테스트/검증 결과

**템플릿:**
```markdown
# Step-{N}.{M} Evidence Log

**Sprint:** Sprint {N} - {Sprint Goal}
**Step:** Step-{N}.{M} - {Step Goal}
**기록일:** {날짜}

---

## 완료한 작업

- [x] {태스크 1}
- [x] {태스크 2}
- [x] {태스크 3}

---

## 생성/수정된 파일

### 새로 생성된 파일
| 파일 경로 | 설명 |
|-----------|------|
| `src/main/java/.../Foo.java` | {설명} |
| `src/test/java/.../FooTest.java` | {설명} |

### 수정된 파일
| 파일 경로 | 변경 내용 |
|-----------|-----------|
| `build.gradle` | {변경 내용} |

---

## 주요 결정사항

### {결정 1}
- **선택:** {선택한 옵션}
- **이유:** {근거}
- **트레이드오프:** {장단점}

---

## 테스트 결과

| 테스트 | 결과 |
|--------|------|
| {테스트명} | ✅ PASSED / ❌ FAILED |
```

---

## 작동 방식

### Step 1: 초기화 확인

**처음 실행 시:**
- `.agile/` 디렉터리가 없으면 생성
- `templates/` 디렉터리 및 템플릿 파일 생성
- `config.yml` 기본 설정 파일 생성

**이미 Sprint가 진행 중이면:**
- 경고 메시지 출력
- 현재 Sprint 완료를 먼저 권장
- 사용자가 강제로 시작을 선택할 수 있도록 옵션 제공

### Step 2: Sprint 계획 초안 생성

**2-1. 컨텍스트 수집:**
- **문서 탐색 순서:**
  1. 프로젝트 루트 (`./how-diagram.md`, `./2w-brainstorm.md`)
  2. `docs/planning/` 폴더
- 🎯 `how-diagram.md` 확인 (실행 로드맵 - 메인)
  - 다음 Sprint에 해당하는 Phase/Sprint 섹션 찾기
  - Phase의 목표와 산출물 파악
- 📚 `2w-brainstorm.md` 확인 (배경 컨텍스트 - 참고용)
- 다음 Sprint 번호 확인 (current-sprint.txt + 1)

**2-2. Sprint 계획 초안 제안 (타임박싱):**
- 파일 경로: `.agile/sprints/sprint-N/plan-draft.md`
- **how-diagram.md의 Phase를 Sprint로 타임박싱**
  - Phase의 논리적 목표 → Sprint Goal
  - 산출물 → Tasks (체크리스트)
  - 기간 설정 (타임박스)
- 템플릿 형식으로 작성:
  - **Quick Guide (리뷰 전 30초 가이드)**
  - Sprint Goal
  - 예상 기간
  - **Sprint 흐름 요약 (US 구성 의도 + 의존 관계)**
  - Tasks (User Story 형식 또는 체크리스트)
  - **각 US에 Intent(의도) 포함 — 왜 이 US가 필요한지**
  - US 구조 (복잡한 Sprint의 경우)
  - Definition of Done

**2-3. 사용자 검토 요청:**
```
📝 Sprint N 계획 초안을 생성했습니다.

📂 파일 위치: .agile/sprints/sprint-N/plan-draft.md

🎯 Sprint Goal: [목표]
📅 제안 기간: N일
📝 태스크: M개

---

이 계획을 검토하신 후 선택해주세요:
1. 이대로 확정 (Sprint 시작)
2. plan-draft.md 파일을 직접 수정 후 확정
3. 계획 수정 필요 (다시 논의)
```

### Step 3: 사용자 확정 대기

**사용자 선택:**
- **1번 선택:** plan-draft.md를 plan.md로 rename, Sprint 시작
- **2번 선택:** 사용자가 파일 수정 후 확정 명령 입력 대기
- **3번 선택:** 대화형으로 수정 사항 수집 후 다시 초안 생성

### Step 4: Sprint 시작 확정

**확정 후:**
- `plan-draft.md` → `plan.md` 로 rename
- 리뷰 완료 기준으로 Quick Guide/임시 해설 문구 정리
- `current-sprint.txt` 업데이트 (Sprint 번호 기록)
- Sprint 시작일 기록

**완료 메시지:**
```
✅ Sprint N이 공식 시작되었습니다!

📋 Sprint Goal: [목표]
📅 기간: {시작일} ~ {종료일} (N일)
📝 태스크: M개

📂 파일 위치: .agile/sprints/sprint-N/plan.md

💡 진행 방법:
1. plan.md 파일을 직접 수정하며 진행 상황 업데이트
2. 완료한 태스크: [ ] → [x]
3. 진행 중인 태스크: "Status: In Progress" 추가

다음 명령어:
- /sprint-status : 진행 상황 확인
- /sprint-complete : Sprint 완료 및 회고
```

---

## Sprint Plan 템플릿

### US 기반 템플릿 (복잡한 Sprint용)

```markdown
# Sprint {N}: {Sprint Goal 짧은 제목}

**기간:** {시작일} ~ {종료일} ({X}일)
**목표:** {Sprint Goal 상세}
**Phase:** {how-diagram.md의 Phase 번호}

---

## Quick Guide (30초 리뷰 가이드)
- 목적: 이번 Sprint의 범위/우선순위/실행 가능성을 빠르게 검증한다.
- 확인1(범위): In/Out Scope가 명확한가?
- 확인2(우선순위): US 순서와 의존 관계가 타당한가?
- 확인3(실행 가능성): 기간 대비 태스크가 과도하지 않은가?
- 위험1: 완료 조건이 모호한 US가 있는가?
- 위험2: 태스크 분해가 과도하거나 중복되는가?
- 5분 순서: Goal/범위 확인 → US 흐름 확인 → DoD/리스크 확인

---

## Sprint Goal

> {한 문장으로 Sprint 목표 요약}

---

## 워크플로우 철학

> **AI 시대의 개발 순서: 작은 단위로 시각화 → 검토 → 구현 반복**

**핵심 원칙:**
1. US 단위로 반복 (인지 부하 최소화)
2. 빠른 피드백 루프 (Checkpoint로 검증)
3. 검증 후 구현 (잘못된 방향 사전 차단)

> **US = 가장 작은 반복 단위.** 리뷰하고 넘어가는 단위가 곧 작업 단위다.

---

## Sprint 흐름 요약

> 이 Sprint의 US 구성과 순서를 설명합니다.

| 순서 | US | 의존 관계 |
|------|----|----|
| 1 | US-{N}.1: {목표} | 없음 |
| 2 | US-{N}.2: {목표} | US-{N}.1 완료 후 |
| 3 | US-{N}.3: {목표} | US-{N}.2 완료 후 |

**이 순서인 이유:** {왜 이 순서로 배치했는지 설명}

---

## Tasks

### Sprint 시작: 프로젝트 방향 결정 (선택)
<!-- 프로젝트 전체 방향을 결정하는 ADR 작성 -->
- [ ] ADR-XXX: {범위 결정 근거}
- [ ] ADR-XXX: {워크플로우 결정 근거}

---

### US-{N}.1: {목표}

**Intent:** {왜 이 US가 필요한지. 이 US가 없으면 어떤 문제가 생기는지.}

- [ ] {시각화/다이어그램 작성}
- [ ] {ADR 작성 (기술 선택이 필요한 경우)}

**Acceptance Criteria:**
- {완료 조건 1}
- {완료 조건 2}

**🔍 Checkpoint:** {검토 및 확정}

---

### US-{N}.2: {목표}

**Intent:** {왜 이 US가 필요한지. 이 US가 없으면 어떤 문제가 생기는지.}

- [ ] {구현 태스크 1}
- [ ] {구현 태스크 2}

**Acceptance Criteria:**
- {완료 조건}

---

### US-{N}.3: {목표}

**Intent:** {왜 이 US가 필요한지.}

<!-- 반복 구조 -->

---

## Sprint {N} Definition of Done

### Sprint 시작 ✅
- [ ] ADR 완성 (필요 시)

### US-{N}.1 ✅
- [ ] 시각화 완성
- [ ] Checkpoint 통과

### US-{N}.2 ✅
- [ ] 구현 완료
- [ ] 검증 완료

### US-{N}.3 ✅
<!-- 반복 -->

### 최종 검증
- [ ] 모든 Acceptance Criteria 충족
- [ ] 문서화 완료

---

## Blockers

- 없음

---

## Notes

<!-- 기타 메모 -->
```

### 단순 템플릿 (간단한 Sprint용)

```markdown
# Sprint {N}: {Sprint Goal 짧은 제목}

**기간:** {시작일} ~ {종료일} ({X}일)
**목표:** {Sprint Goal 상세}

---

## Quick Guide (30초 리뷰 가이드)
- 목적: 이번 Sprint의 범위/우선순위/실행 가능성을 빠르게 검증한다.
- 확인1(범위): 목표 범위가 명확한가?
- 확인2(우선순위): 태스크 순서가 타당한가?
- 확인3(실행 가능성): 기간 내 완료 가능한가?
- 위험1: 완료 조건이 모호한 태스크가 있는가?
- 위험2: 중요 태스크 누락이 있는가?
- 5분 순서: Goal 확인 → Tasks 확인 → 리스크 확인

---

## Sprint Goal

> {한 문장으로 Sprint 목표 요약}

---

## Tasks

### 📋 To Do
- [ ] {태스크 1}
- [ ] {태스크 2}
- [ ] {태스크 3}

### 🔄 In Progress
<!-- 진행 중인 태스크 -->

### ✅ Completed
<!-- 완료한 태스크는 여기로 이동 -->

---

## Blockers

- 없음

---

## Notes

<!-- 기타 메모 -->
```

---

## 중요 원칙

### 1. 사용자 주도권 유지

- ✅ AI는 도구일 뿐, 사용자가 Sprint 목표 결정
- ✅ AI는 초안만 제안, 사용자가 최종 확정
- ✅ plan.md 파일을 직접 수정 (AI가 대신하지 않음)

### 2. 2w-brainstorm.md 및 how-diagram.md 기반 계획

- ✅ 기획 문서가 있으면 반드시 참조
- ✅ Sprint 범위를 명확히 정의 (Phase 범위 내)
- ✅ 범위를 벗어나지 않음

### 3. ADR 작성 시점

ADR은 **아키텍처 고민이 발생한 시점에 자연스럽게 작성**:
- Sprint 시작 시: 프로젝트 전체 방향 결정
- US 시작 시: 기술 스택 또는 아키텍처 패턴 선택

---

## ✅ AI가 해야 할 것

- `.agile/` 구조 자동 생성
- `how-diagram.md` (루트/docs) 기반 Sprint 계획 초안 생성
- 템플릿 자동 제공
- 사용자 선택에 따라 파일 rename 및 Sprint 시작
- 필요 시 **step-N.M-log.md 증적 로그 생성** (선택, 증적/메트릭/결정 로그 중심)

## ❌ AI가 하지 말아야 할 것

- 사용자 대신 Sprint Goal 결정
- 사용자 대신 태스크 생성 (초안 제안은 OK, 강요는 NO)
- 사용자 동의 없이 Sprint 시작
- plan.md 파일을 사용자 동의 없이 수정
- Quick Guide와 중복되는 설명용 Summary를 강제 생성

---

## 다음 스텝

Sprint 시작 후 사용자가 할 일:

1. **plan.md 파일 직접 수정** - 진행하면서 체크리스트 업데이트
2. **`/sprint-status`** - 진행 상황 확인
3. **`/sprint-complete`** - Sprint 완료 및 회고 작성

---

**버전:** 3.2.0
**최종 업데이트:** 2026-02-24
**변경 사항:**
- **v3.2.0:** SI-002 반영 — `US Summary` 중복 제거 기준 적용
  - `US Summary` 용어를 증적 중심 `Step Evidence Log`로 전환
  - 문서 이해 보조 역할은 `Quick Guide`로 통합
  - 피드백 전용 섹션 제거, 로그는 증적/메트릭/결정 기록에 집중
- **Enhancement:** Sprint 2 회고 반영 — plan-draft 리뷰 품질 향상
  - US 기반 템플릿에 "Sprint 흐름 요약" 섹션 추가 (US 구성 의도 + 순서 + 의존 관계)
  - 각 US에 "Intent(의도)" 섹션 추가 (왜 이 US가 필요한지)
  - Step 2-2 지침에 Intent 포함 명시
- **v3.0.0:** Iteration 중간 계층 제거, Sprint > US 2단계 구조로 단순화
  - US = 가장 작은 반복 단위 (리뷰하고 넘어가는 단위)
  - Sprint ≈ Iteration (애자일 표준 — 같은 레벨 개념)
- **Refactor:** Summary 파일: `iteration-N-summary.md` → `us-N.M-summary.md`
- **Refactor:** Sprint Plan 템플릿: US 기반 구조로 변경
