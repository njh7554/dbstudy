-- 학생 이름, 담당 교수 이름 조회하기
SELECT S.S_NAME, P.P_NAME
  FROM PROFESSOR_TBL P INNER JOIN STUDENT_TBL S
    ON P.P_NO = S.P_NO;
    
SELECT S.S_NAME, P.P_NAME
  FROM PROFESSOR_TBL P, STUDENT_TBL S
 WHERE P.P_NO = S.P_NO;
 
-- 교수번호, 교수이름, 교수전공, 강의이름, 강의실위치를 조회하기
-- 기존 문법
SELECT P.P_NO AS 교수번호, P.P_NAME AS 교수이름, P.P_MAJOR AS 교수전공, L.L_NAME AS 강의이름, L.L_LOCATION AS 강의실위치
  FROM PROFESSOR_TBL P INNER JOIN LECTURE_TBL L
    ON P.P_NO = L.P_NO;
    
-- 오라클 문법
SELECT P.P_NO AS 교수번호, P.P_NAME AS 교수이름, P.P_MAJOR AS 교수전공, L.L_NAME AS 강의이름, L.L_LOCATION AS 강의실위치
  FROM PROFESSOR_TBL P, LECTURE_TBL L
 WHERE P.P_NO = L.P_NO;
 
-- 학번, 학생이름, 수강 신청한 과목 이름을 조회하시오.
-- 기존 문법
SELECT S.S_NO AS 학번, S.S_NAME AS 학생이름, C.C_NAME AS 수강신청과목
  FROM STUDENT_TBL S INNER JOIN ENROLL_TBL E 
    ON S.S_NO = E.S_NO INNER JOIN COURSE_TBL C 
    ON E.C_NO = C.C_NO;

-- 오라클 문법
SELECT S.S_NO AS 학번, S.S_NAME AS 학생이름, C.C_NAME AS 수강신청과목
  FROM STUDENT_TBL S, ENROLL_TBL E, COURSE_TBL C
 WHERE S.S_NO = E.S_NO
   AND E.C_NO = C.C_NO;
     
-- 모든 교수들의 교수이름과 교수전공, 강의이름을 조회하시오
SELECT P.P_NAME, P.P_MAJOR, L.L_NAME 
  FROM PROFESSOR_TBL P LEFT OUTER JOIN LECTURE_TBL L
    ON P.P_NO = L.P_NO;

-- 오라클 문법
SELECT P.P_NAME AS 교수이름, P.P_MAJOR AS 교수전공, NVL(L.L_NAME, '강의 없음') AS 강의명 
  FROM PROFESSOR_TBL P, LECTURE_TBL L
 WHERE P.P_NO = L.P_NO(+);