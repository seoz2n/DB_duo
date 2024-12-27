-- ��ȭ ����

INSERT INTO movie (mno, title, pdate, producer) VALUES (1, '�����', TO_DATE('2019-05-30', 'YYYY-MM-DD'), '����ȣ');
INSERT INTO movie (mno, title, pdate, producer) VALUES (2, '�õ庸��', TO_DATE('2003-11-21', 'YYYY-MM-DD'), '������');
INSERT INTO movie (mno, title, pdate, producer) VALUES (3, '�ϻ�', TO_DATE('2015-07-22', 'YYYY-MM-DD'), '�ֵ���');
INSERT INTO movie (mno, title, pdate, producer) VALUES (4, '��', TO_DATE('2014-07-30', 'YYYY-MM-DD'), '���ѹ�');
INSERT INTO movie (mno, title, pdate, producer) VALUES (5, '��������', TO_DATE('2019-01-23', 'YYYY-MM-DD'), '�̺���');
INSERT INTO movie (mno, title, pdate, producer) VALUES (6, '�ýÿ�����', TO_DATE('2017-08-02', 'YYYY-MM-DD'), '����');
INSERT INTO movie (mno, title, pdate, producer) VALUES (7, '��������', TO_DATE('2014-12-17', 'YYYY-MM-DD'), '������');
INSERT INTO movie (mno, title, pdate, producer) VALUES (8, '���� ����', TO_DATE('2005-12-29', 'YYYY-MM-DD'), '������');
INSERT INTO movie (mno, title, pdate, producer) VALUES (9, '���ϵ�', TO_DATE('2012-07-25', 'YYYY-MM-DD'), '�ֵ���');
INSERT INTO movie (mno, title, pdate, producer) VALUES (10, '�Ű� �Բ�-�˿� ��', TO_DATE('2017-12-20', 'YYYY-MM-DD'), '���ȭ');

select * from movie;

-- ��� ����(��ȣ, �̸�, �Ҽӻ�, ����ó)
INSERT INTO actor (ano, aname, agency, acont) VALUES (1, '�۰�ȣ', 'ȣ���̿������θ�Ʈ', '01012345678');
INSERT INTO actor (ano, aname, agency, acont) VALUES (2, '�̺���', 'BH�������θ�Ʈ', '01023456789');
INSERT INTO actor (ano, aname, agency, acont) VALUES (3, '������', '�Ŵ�����Ʈ ��', '01034567890');
INSERT INTO actor (ano, aname, agency, acont) VALUES (4, '������', '��ũ�Ͽ콺���۴�', '01045678901');
INSERT INTO actor (ano, aname, agency, acont) VALUES (5, '������', 'ȣ�ξ����������θ�Ʈ', '01056789012');
INSERT INTO actor (ano, aname, agency, acont) VALUES (6, '������', '����ġ�������θ�Ʈ', '01067890123');
INSERT INTO actor (ano, aname, agency, acont) VALUES (7, '��γ�', '�����翣�����θ�Ʈ', '01078901234');
INSERT INTO actor (ano, aname, agency, acont) VALUES (8, '������', 'UAA', '01089012345');
INSERT INTO actor (ano, aname, agency, acont) VALUES (9, '������', 'BH�������θ�Ʈ', '01090123456');
INSERT INTO actor (ano, aname, agency, acont) VALUES (10, '������', '��Ƽ��Ʈ���۴�', '01091234567');

select * from actor;

-- ACTASSIGN(��ȭ-��� ���� : ���� ��ȣ, ��� ��ȣ, ��ȭ ��ȣ, �⿬��, ��� ����{��/����})
INSERT INTO ACTASSIGN (asno, ano, mno, apay, aroll) VALUES (1, 1, 1, 50000000, '�ֿ�');
INSERT INTO ACTASSIGN (asno, ano, mno, apay, aroll) VALUES (2, 2, 1, 30000000, '����');
INSERT INTO ACTASSIGN (asno, ano, mno, apay, aroll) VALUES (3, 3, 2, 40000000, '�ֿ�');
INSERT INTO ACTASSIGN (asno, ano, mno, apay, aroll) VALUES (4, 4, 3, 45000000, '�ֿ�');
INSERT INTO ACTASSIGN (asno, ano, mno, apay, aroll) VALUES (5, 5, 3, 25000000, '����');
INSERT INTO ACTASSIGN (asno, ano, mno, apay, aroll) VALUES (6, 6, 4, 35000000, '����');
INSERT INTO ACTASSIGN (asno, ano, mno, apay, aroll) VALUES (7, 7, 5, 60000000, '�ֿ�');
INSERT INTO ACTASSIGN (asno, ano, mno, apay, aroll) VALUES (8, 8, 6, 32000000, '����');
INSERT INTO ACTASSIGN (asno, ano, mno, apay, aroll) VALUES (9, 9, 7, 30000000, '����');
INSERT INTO ACTASSIGN (asno, ano, mno, apay, aroll) VALUES (10, 10, 8, 70000000, '�ֿ�');



-- ���� ã�� SQL��(����� ��ȭ�� �⿬�� ���)
SELECT a.aname AS ����̸�
FROM movie m
JOIN actassign aa ON m.mno = aa.mno
JOIN actor a ON aa.ano = a.ano
WHERE m.title = '�����' AND aa.aroll = '�ֿ�';

-- ���� ã�� SQL��(����� ��ȭ�� �⿬�� ���� �⿬��)
SELECT a.aname AS ����̸�, aa.apay AS �⿬��
FROM movie m
JOIN actassign aa ON m.mno = aa.mno
JOIN actor a ON aa.ano = a.ano
WHERE m.title = '�����' AND aa.aroll = '�ֿ�';


-- GENRE ���̺� ������ ���� ����
INSERT INTO genre (gno, gname) VALUES (1, '���');
INSERT INTO genre (gno, gname) VALUES (2, '�׼�');
INSERT INTO genre (gno, gname) VALUES (3, '������');
INSERT INTO genre (gno, gname) VALUES (4, '�θǽ�');
INSERT INTO genre (gno, gname) VALUES (5, '�ڹ̵�');
INSERT INTO genre (gno, gname) VALUES (6, '�������');
INSERT INTO genre (gno, gname) VALUES (7, '��Ÿ��');
INSERT INTO genre (gno, gname) VALUES (8, '����');
INSERT INTO genre (gno, gname) VALUES (9, '����');
INSERT INTO genre (gno, gname) VALUES (10, '��ť���͸�');

SELECT * FROM genre;


-- gassign ���̺� mno �÷� �߰�
ALTER TABLE gassign
ADD mno NUMBER(10);

-- mno �÷��� movie ���̺��� mno�� ����
ALTER TABLE gassign
ADD CONSTRAINT fk_gassign_mno FOREIGN KEY (mno) REFERENCES movie(mno);



-- gassign ���̺� ������ ���� ����
INSERT INTO gassign (gano, gno, mno) VALUES (1, 1, 1); -- �����: ���
INSERT INTO gassign (gano, gno, mno) VALUES (2, 2, 2); -- �õ庸��: �׼�
INSERT INTO gassign (gano, gno, mno) VALUES (3, 3, 3); -- �ϻ�: ������
INSERT INTO gassign (gano, gno, mno) VALUES (4, 4, 4); -- ��: �θǽ�
INSERT INTO gassign (gano, gno, mno) VALUES (5, 5, 5); -- ��������: �ڹ̵�
INSERT INTO gassign (gano, gno, mno) VALUES (6, 6, 6); -- �ýÿ�����: �������
INSERT INTO gassign (gano, gno, mno) VALUES (7, 7, 7); -- ��������: ��Ÿ��
INSERT INTO gassign (gano, gno, mno) VALUES (8, 8, 8); -- ���� ����: ����
INSERT INTO gassign (gano, gno, mno) VALUES (9, 9, 9); -- ���ϵ�: ����
INSERT INTO gassign (gano, gno, mno) VALUES (10, 10, 10); -- �Ű� �Բ�: ��ť���͸�

-- ������ ������ ���� ���

-- staff ���̺� ������ ���� ����
INSERT INTO staff (sno, sname, srank, scont, sroll) VALUES (1, 'ȫ�浿', '����', '01012345678', '����');
INSERT INTO staff (sno, sname, srank, scont, sroll) VALUES (2, '��ö��', '�۰�', '01023456789', '�뺻 �ۼ�');
INSERT INTO staff (sno, sname, srank, scont, sroll) VALUES (3, '�̿���', '�Կ� ����', '01034567890', '�Կ�');
INSERT INTO staff (sno, sname, srank, scont, sroll) VALUES (4, '�ڹμ�', '���� ����', '01045678901', '���� ����');
INSERT INTO staff (sno, sname, srank, scont, sroll) VALUES (5, '�ּ���', '���� ����', '01056789012', '����');
INSERT INTO staff (sno, sname, srank, scont, sroll) VALUES (6, '�念ȣ', '���� ����', '01067890123', '���� ����');
INSERT INTO staff (sno, sname, srank, scont, sroll) VALUES (7, '���̶�', '�ǻ� �����̳�', '01078901234', '�ǻ� ����');
INSERT INTO staff (sno, sname, srank, scont, sroll) VALUES (8, '���ؼ�', '�̼� ����', '01089012345', '��Ʈ ������');
INSERT INTO staff (sno, sname, srank, scont, sroll) VALUES (9, '������', '���ε༭', '01090123456', '���� ����');
INSERT INTO staff (sno, sname, srank, scont, sroll) VALUES (10, '�̵���', '�Կ� ����', '01091234567', '�Կ� ����');

SELECT * FROM staff;


-- sassign ���̺� ������ ���� ����
INSERT INTO sassign (sano, mno, sno, spay) VALUES (1, 1, 1, 100000000); -- �����, ȫ�浿(����)
INSERT INTO sassign (sano, mno, sno, spay) VALUES (2, 1, 2, 50000000);  -- �����, ��ö��(�۰�)
INSERT INTO sassign (sano, mno, sno, spay) VALUES (3, 1, 3, 70000000);  -- �����, �̿���(�Կ� ����)
INSERT INTO sassign (sano, mno, sno, spay) VALUES (4, 2, 4, 60000000);  -- �õ庸��, �ڹμ�(���� ����)
INSERT INTO sassign (sano, mno, sno, spay) VALUES (5, 3, 5, 40000000);  -- �ϻ�, �ּ���(���� ����)
INSERT INTO sassign (sano, mno, sno, spay) VALUES (6, 4, 6, 45000000);  -- ��, �念ȣ(���� ����)
INSERT INTO sassign (sano, mno, sno, spay) VALUES (7, 5, 7, 30000000);  -- ��������, ���̶�(�ǻ� �����̳�)
INSERT INTO sassign (sano, mno, sno, spay) VALUES (8, 6, 8, 35000000);  -- �ýÿ�����, ���ؼ�(�̼� ����)
INSERT INTO sassign (sano, mno, sno, spay) VALUES (9, 7, 9, 80000000);  -- ��������, ������(���ε༭)
INSERT INTO sassign (sano, mno, sno, spay) VALUES (10, 8, 10, 20000000); -- ���� ����, �̵���(�Կ� ����)

SELECT * FROM SASSIGN;

-- ������

-- sponsor ���̺� ������ ���� ����
INSERT INTO sponsor (spno, company, spcont) VALUES (1, 'CJ �������θ�Ʈ', '01012345678');
INSERT INTO sponsor (spno, company, spcont) VALUES (2, '�Ե� ��ó����', '01023456789');
INSERT INTO sponsor (spno, company, spcont) VALUES (3, 'NEW (Next Entertainment World)', '01034567890');
INSERT INTO sponsor (spno, company, spcont) VALUES (4, '��ڽ�', '01045678901');
INSERT INTO sponsor (spno, company, spcont) VALUES (5, '�ް��ڽ��߾��÷�����', '01056789012');
INSERT INTO sponsor (spno, company, spcont) VALUES (6, '�Ǿ��׸�', '01067890123');
INSERT INTO sponsor (spno, company, spcont) VALUES (7, '���ʺ����� �ڸ���', '01078901234');
INSERT INTO sponsor (spno, company, spcont) VALUES (8, '20���� ��Ʃ���', '01089012345');
INSERT INTO sponsor (spno, company, spcont) VALUES (9, '����� �ڸ���', '01090123456');
INSERT INTO sponsor (spno, company, spcont) VALUES (10, '���ø��� �ڸ���', '01091234567');

SELECT * FROM sponsor;

-- ���� - ��ȭ ����
-- spassign ���̺� ������ ���� ����
INSERT INTO spassign (spano, product, rdate, mno, spno, rtdate) 
VALUES (1, 'ī�޶�', TO_DATE('2019-05-01', 'YYYY-MM-DD'), 1, 1, TO_DATE('2019-05-30', 'YYYY-MM-DD')); -- ����� - CJ �������θ�Ʈ
INSERT INTO spassign (spano, product, rdate, mno, spno, rtdate) 
VALUES (2, '�ǻ�', TO_DATE('2019-04-15', 'YYYY-MM-DD'), 1, 7, TO_DATE('2019-05-25', 'YYYY-MM-DD')); -- ����� - ���ʺ����� �ڸ���
INSERT INTO spassign (spano, product, rdate, mno, spno, rtdate) 
VALUES (3, '���θ��', TO_DATE('2003-10-01', 'YYYY-MM-DD'), 2, 2, TO_DATE('2003-12-01', 'YYYY-MM-DD')); -- �õ庸�� - �Ե� ��ó����
INSERT INTO spassign (spano, product, rdate, mno, spno, rtdate) 
VALUES (4, '��ǰ', TO_DATE('2015-06-01', 'YYYY-MM-DD'), 3, 3, TO_DATE('2015-07-20', 'YYYY-MM-DD')); -- �ϻ� - NEW
INSERT INTO spassign (spano, product, rdate, mno, spno, rtdate) 
VALUES (5, '���� ���', TO_DATE('2014-06-01', 'YYYY-MM-DD'), 4, 4, TO_DATE('2014-07-10', 'YYYY-MM-DD')); -- �� - ��ڽ�
INSERT INTO spassign (spano, product, rdate, mno, spno, rtdate) 
VALUES (6, '�Կ� ���', TO_DATE('2019-01-01', 'YYYY-MM-DD'), 5, 5, TO_DATE('2019-02-15', 'YYYY-MM-DD')); -- �������� - �ް��ڽ��߾��÷�����
INSERT INTO spassign (spano, product, rdate, mno, spno, rtdate) 
VALUES (7, 'VFX ����Ʈ����', TO_DATE('2017-07-01', 'YYYY-MM-DD'), 6, 6, TO_DATE('2017-08-01', 'YYYY-MM-DD')); -- �ýÿ����� - �Ǿ��׸�
INSERT INTO spassign (spano, product, rdate, mno, spno, rtdate) 
VALUES (8, '����', TO_DATE('2014-10-01', 'YYYY-MM-DD'), 7, 8, TO_DATE('2014-11-01', 'YYYY-MM-DD')); -- �������� - 20���� ��Ʃ���
INSERT INTO spassign (spano, product, rdate, mno, spno, rtdate) 
VALUES (9, '���� ���', TO_DATE('2005-11-01', 'YYYY-MM-DD'), 8, 9, TO_DATE('2005-12-15', 'YYYY-MM-DD')); -- ���� ���� - ����� �ڸ���
INSERT INTO spassign (spano, product, rdate, mno, spno, rtdate) 
VALUES (10, '���� ���� ����Ʈ����', TO_DATE('2017-11-01', 'YYYY-MM-DD'), 10, 10, TO_DATE('2017-12-01', 'YYYY-MM-DD')); -- �Ű� �Բ� - ���ø��� �ڸ���


SELECT * FROM spassign;
