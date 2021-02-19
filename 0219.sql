ALTER TABLE BOARD MODIFY SUBJECT VARCHAR(100);
-- 출근시간 기록
INSERT INTO COMMUTE (MEMBER_ID, STATUS)
VALUES ('potato', 1);

SELECT COUNT(*)
FROM COMMUTE
WHERE MEMBER_ID = 'potato';

-- 우선 이번달 데이터 뽑는법

--select convert(char(7),DATEADD(mm,-1,getdate()),121)+'-01' --전달 1일
--select convert(char(7),getdate(),121)+'-01'                         --이번달 1일
--select convert(char(7),DATEADD(mm,+1,getdate()),121)+'-01' --다음달 1일

-- 일단 다뽑아본거
SELECT TO_CHAR(C_DATE, 'YYYY.MM.DD') 날짜, TO_CHAR(ON_TIME, 'HH24:MI:SS') 출근, TO_CHAR(OFF_TIME, 'HH24:MI:SS') 퇴근, STATUS
FROM COMMUTE
WHERE MEMBER_ID = 'potato';

-- 이번달을 입력해서 구함
SELECT TO_CHAR(C_DATE, 'YYYY.MM.DD') 날짜, TO_CHAR(ON_TIME, 'HH24:MI:SS') 출근, TO_CHAR(OFF_TIME, 'HH24:MI:SS') 퇴근, STATUS
FROM (SELECT * FROM COMMUTE WHERE C_DATE LIKE '21/02/%')
WHERE MEMBER_ID = 'potato';


SELECT TO_CHAR(C_DATE, 'YYYY.MM.DD') 날짜, TO_CHAR(ON_TIME, 'HH24:MI:SS') 출근, TO_CHAR(OFF_TIME, 'HH24:MI:SS') 퇴근, STATUS
FROM (SELECT *
        FROM COMMUTE
       WHERE C_DATE LIKE (SELECT TO_CHAR(SYSDATE,'YY/MM')
                            FROM DUAL))
WHERE MEMBER_ID = 'potato';

-- 이번 달
SELECT TO_CHAR(SYSDATE,'YY/MM') FROM DUAL;

SELECT *
FROM(SELECT TO_CHAR(C_DATE, 'YY/MM') YYMM, MEMBER_ID, STATUS
       FROM COMMUTE)
WHERE YYMM LIKE (SELECT TO_CHAR(SYSDATE,'YY/MM') FROM DUAL);

-- 일단 해당 아이디 데이터 가져와서
SELECT * FROM COMMUTE
WHERE MEMBER_ID = 'potato';

SELECT *
FROM (SELECT *
        FROM COMMUTE
       WHERE MEMBER_ID = 'potato')
WHERE C_DATE LIKE '21/02/%';

-- 이번달 출퇴근 기록 ( 아이디랑 상태값 ) 뽑고 그중에 해당 아이디로 뽑고
SELECT *
FROM(SELECT *
FROM(SELECT TO_CHAR(C_DATE, 'YY/MM') YYMM, MEMBER_ID, STATUS
       FROM COMMUTE)
      WHERE YYMM LIKE (SELECT TO_CHAR(SYSDATE,'YY/MM')
                         FROM DUAL))
WHERE MEMBER_ID = 'potato';

-- 포테이토가 이번달 지각한거
SELECT COUNT(*)
FROM(SELECT *
FROM(SELECT *
FROM(SELECT TO_CHAR(C_DATE, 'YY/MM') YYMM, MEMBER_ID, STATUS
       FROM COMMUTE)
      WHERE YYMM LIKE (SELECT TO_CHAR(SYSDATE,'YY/MM')
                         FROM DUAL))
WHERE MEMBER_ID = 'potato')
WHERE STATUS = 1;

-- 포테이토가 이번달 정상출근한거
SELECT COUNT(*)
FROM(SELECT *
FROM(SELECT *
FROM(SELECT TO_CHAR(C_DATE, 'YY/MM') YYMM, MEMBER_ID, STATUS
       FROM COMMUTE)
      WHERE YYMM LIKE (SELECT TO_CHAR(SYSDATE,'YY/MM')
                         FROM DUAL))
WHERE MEMBER_ID = 'potato')
WHERE STATUS = 0;



-- ID=포테이토의 이번달 현황 (그룹바이)
SELECT STATUS, COUNT(*)
FROM(SELECT *
FROM(SELECT *
FROM(SELECT TO_CHAR(C_DATE, 'YY/MM') YYMM, MEMBER_ID, STATUS
       FROM COMMUTE)
      WHERE YYMM LIKE (SELECT TO_CHAR(SYSDATE,'YY/MM')
                         FROM DUAL))
                        WHERE MEMBER_ID = 'potato')
GROUP BY STATUS;




SELECT COUNT(*)
FROM COMMUTE
WHERE STATUS = 1;

SELECT COUNT(*)
FROM COMMUTE
WHERE STATUS = 0;



SELECT COUNT(*)
		  FROM (SELECT *
                  FROM (SELECT *
                          FROM (SELECT TO_CHAR(C_DATE, 'YY/MM') YYMM, MEMBER_ID, STATUS
                                  FROM COMMUTE)
                                 WHERE YYMM LIKE (SELECT TO_CHAR(SYSDATE,'YY/MM')
                                                    FROM DUAL)
                               )
                 WHERE MEMBER_ID = 'potato')
         WHERE STATUS = 0;


