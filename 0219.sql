ALTER TABLE BOARD MODIFY SUBJECT VARCHAR(100);
-- ��ٽð� ���
INSERT INTO COMMUTE (MEMBER_ID, STATUS)
VALUES ('potato', 1);

SELECT COUNT(*)
FROM COMMUTE
WHERE MEMBER_ID = 'potato';

-- �켱 �̹��� ������ �̴¹�

--select convert(char(7),DATEADD(mm,-1,getdate()),121)+'-01' --���� 1��
--select convert(char(7),getdate(),121)+'-01'                         --�̹��� 1��
--select convert(char(7),DATEADD(mm,+1,getdate()),121)+'-01' --������ 1��

-- �ϴ� �ٻ̾ƺ���
SELECT TO_CHAR(C_DATE, 'YYYY.MM.DD') ��¥, TO_CHAR(ON_TIME, 'HH24:MI:SS') ���, TO_CHAR(OFF_TIME, 'HH24:MI:SS') ���, STATUS
FROM COMMUTE
WHERE MEMBER_ID = 'potato';

-- �̹����� �Է��ؼ� ����
SELECT TO_CHAR(C_DATE, 'YYYY.MM.DD') ��¥, TO_CHAR(ON_TIME, 'HH24:MI:SS') ���, TO_CHAR(OFF_TIME, 'HH24:MI:SS') ���, STATUS
FROM (SELECT * FROM COMMUTE WHERE C_DATE LIKE '21/02/%')
WHERE MEMBER_ID = 'potato';


SELECT TO_CHAR(C_DATE, 'YYYY.MM.DD') ��¥, TO_CHAR(ON_TIME, 'HH24:MI:SS') ���, TO_CHAR(OFF_TIME, 'HH24:MI:SS') ���, STATUS
FROM (SELECT *
        FROM COMMUTE
       WHERE C_DATE LIKE (SELECT TO_CHAR(SYSDATE,'YY/MM')
                            FROM DUAL))
WHERE MEMBER_ID = 'potato';

-- �̹� ��
SELECT TO_CHAR(SYSDATE,'YY/MM') FROM DUAL;

SELECT *
FROM(SELECT TO_CHAR(C_DATE, 'YY/MM') YYMM, MEMBER_ID, STATUS
       FROM COMMUTE)
WHERE YYMM LIKE (SELECT TO_CHAR(SYSDATE,'YY/MM') FROM DUAL);

-- �ϴ� �ش� ���̵� ������ �����ͼ�
SELECT * FROM COMMUTE
WHERE MEMBER_ID = 'potato';

SELECT *
FROM (SELECT *
        FROM COMMUTE
       WHERE MEMBER_ID = 'potato')
WHERE C_DATE LIKE '21/02/%';

-- �̹��� ����� ��� ( ���̵�� ���°� ) �̰� ���߿� �ش� ���̵�� �̰�
SELECT *
FROM(SELECT *
FROM(SELECT TO_CHAR(C_DATE, 'YY/MM') YYMM, MEMBER_ID, STATUS
       FROM COMMUTE)
      WHERE YYMM LIKE (SELECT TO_CHAR(SYSDATE,'YY/MM')
                         FROM DUAL))
WHERE MEMBER_ID = 'potato';

-- �������䰡 �̹��� �����Ѱ�
SELECT COUNT(*)
FROM(SELECT *
FROM(SELECT *
FROM(SELECT TO_CHAR(C_DATE, 'YY/MM') YYMM, MEMBER_ID, STATUS
       FROM COMMUTE)
      WHERE YYMM LIKE (SELECT TO_CHAR(SYSDATE,'YY/MM')
                         FROM DUAL))
WHERE MEMBER_ID = 'potato')
WHERE STATUS = 1;

-- �������䰡 �̹��� ��������Ѱ�
SELECT COUNT(*)
FROM(SELECT *
FROM(SELECT *
FROM(SELECT TO_CHAR(C_DATE, 'YY/MM') YYMM, MEMBER_ID, STATUS
       FROM COMMUTE)
      WHERE YYMM LIKE (SELECT TO_CHAR(SYSDATE,'YY/MM')
                         FROM DUAL))
WHERE MEMBER_ID = 'potato')
WHERE STATUS = 0;



-- ID=���������� �̹��� ��Ȳ (�׷����)
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


