# Legacy Migration Report - [프로젝트명]

## 한눈에 결론
- 마이그레이션 결과 요약:
- 주요 이슈:
- 후속 조치 우선순위:

---

## 1) 왜 이 마이그레이션을 수행했는가
- 이전 산출물 문제/제약:
- 이번 실행 목표:
- 성공 판단 기준:

## 2) 어떤 조건으로 실행했는가
- 생성 시각:
- 모드: dry-run | apply
- 프로젝트 루트:
- 프로필: legacy-generic | eda-poc-default
- 대상 루프:
- 덮어쓰기 옵션:

## 3) 무엇이 어디로 연결됐는가 (매핑 결과)
| 항목 | 레거시 소스 | 신버전 대상 | 상태 | 메모 |
| --- | --- | --- | --- | --- |
| 2W Brainstorm | `auto-detected or --source-2w` | `.agile/loops/loop-vN/define-2w.md` |  |  |
| Case Study | `auto-detected or --source-case-study` | `.agile/loops/loop-vN/define-2w-case-study.md` |  |  |
| How Diagram | `auto-detected or --source-how` | `.agile/loops/loop-vN/design-phase.md` |  |  |

## 4) 실행 결과를 어떻게 해석하는가
- copied:
- overwritten:
- skipped_destination_exists:
- missing_source:
- would_copy:
- would_overwrite:
- would_skip_destination_exists:

## 5) 다음 단계 인계
1. `/define-2w` 또는 `/design-phase` 진입 경로 확정
2. 신버전 템플릿 기준 헤더/섹션 정합성 점검
3. 필요한 수동 보정 반영

---

## 부록) 운영 로그 (필요 시만 작성)
- 실패 항목 상세:
- 재시도 계획:
