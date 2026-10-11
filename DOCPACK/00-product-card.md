---
title: solo-learning — Product Card
doc_id: CARD-solo-learning
doc_type: product-card
verdict: showcase
version: 0.1
date: 2026-10-11
status: ร่างเพื่อพิจารณา
owner: Product owner (Book Dev)
---

# solo-learning — Product Card

## 1. สรุปคุณค่าในหนึ่งประโยค

เก็บโจทย์ฝึกทักษะ (challenge) และการมอบหมาย/สถานะ เพื่อติดตามการเรียนรู้ของเจ้าของ

## 2. ปัญหาและผู้ใช้เป้าหมาย

แผนการเรียนรู้และโจทย์ไม่มีสถานะที่ query ได้ ผู้ใช้คือเจ้าของ

## 3. สิ่งที่ทำได้จริงตอนนี้

- REST `/v1/challenges`, `/v1/challenge-assignments` (กรอง `challenge_type`, `category`, `status`)
- ทุกการเขียนผ่านลำดับ precheck → เปลี่ยนข้อมูลในเครื่อง → execution บน empire-platform → commit → finish พร้อม row hash และ RLS แบบบังคับต่อ workspace (ตาม README)

## 4. หลักฐานสถานะ

| รายการ | ค่า |
|---|---|
| Stack | Python, FastAPI, PostgreSQL (Neon) |
| Commit | 2 ครั้ง (2026-10-11 ถึง 2026-10-11) |
| ซอร์สโค้ด | 15 ไฟล์ / 2208 บรรทัด |
| เทสต์ | 2 ไฟล์ (ไม่ได้รันในงานนี้) |
| CI | ไม่มี workflow |
| Deploy config | Railway (Serverless) + Neon; ทะเบียน `online-systems.yaml` ระบุสถานะ online (ไม่ได้ probe สดในงานนี้) |
| Live URL | ดูทะเบียน `online-systems.yaml` (ไม่ได้ probe สด) |

## 5. คุณค่าและจุดต่าง

- เป็นส่วนหนึ่งของสถาปัตยกรรม decentralize ที่ 1 domain = 1 cell จึงเปลี่ยนหรือขายแยกได้
- ใช้สิทธิ์/audit กลางร่วมกันโดยไม่ต้องเขียนใหม่ต่อ cell
- **[สมมติฐาน]** มูลค่าเชิงรายได้ยังไม่พิสูจน์ — ใช้เป็นระบบของเจ้าของก่อน

## 6. ช่องว่างสำคัญ

- พึ่ง empire-platform ตัวเดียว: ถ้า platform ล่ม cell เขียนไม่ได้ (fail closed)
- เนื้อหาหลักสูตรอยู่ใน solo-knowledge ยังไม่มีการเชื่อมกับ cell นี้ที่ยืนยันได้
- ไม่มี UI

## 7. คำตัดสิน

**`showcase`** — ใช้งานส่วนตัวได้ ยังไม่ชัดว่ามีผู้ใช้/มูลค่านอกเหนือจากบันทึกของเจ้าของ จะเปลี่ยนเป็น `invest` หากมีผู้ใช้/ข้อมูลจริงที่พิสูจน์คุณค่าเกินบันทึกส่วนตัว

## 8. ขั้นต่อไป

1. เชื่อม challenge กับเนื้อหาใน solo-knowledge หรือยุบรวม

## การอนุมัติ

| บทบาท | สถานะ | วันที่ | ลงนาม |
|---|---|---|---|
| Product owner (Book Dev) | รอพิจารณา | — | ________ |

## แหล่งข้อมูล

- `README.md`
- `cell.yaml`
- `tests/`
