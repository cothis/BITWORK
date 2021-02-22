CREATE TABLE MU_EXHIBITION
(
    EXHIB_IDX          NUMBER(10) PRIMARY KEY, -- 전시 번호
    EXHIB_SUBJECT      VARCHAR2(100) NOT NULL, -- 전시 제목
    EXHIB_PERIOD_START DATE,                   -- 전시 시작일
    EXHIB_PERIOD_END   DATE,                   -- 전시 종료일
    EXHIB_VENUE        VARCHAR(100),           -- 전시 장소(B1, 1F, 2F, GALLERY4 등등)
    EXHIB_ARTIST       VARCHAR2(300),          -- 작가 (협업 작가들 포함)
    EXHIB_ARTWORKS_CNT VARCHAR2(300),          -- 전시작품수
    EXHIB_ADMISSION    VARCHAR2(100),          -- 관람료
    EXHIB_ORGANIZATION VARCHAR2(100),          -- 후원(주최)기관
    EXHIB_CONTENT      CLOB,                   -- 전시 내용 설명
    EXHIB_THUMB_PATH   VARCHAR2(30)            -- 전시 이미지 파일 주소
);

CREATE SEQUENCE EXHIB_SEQ INCREMENT BY 1 START WITH 1 NOCACHE;