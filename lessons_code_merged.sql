L1
Pokaż raport prezentujący i, n pracownika oraz jego wynagrodzenie caloroczne.
select first_name imie, last_name nazwisko, salary, bonus, 12*salary+bonus from employees;

desc employees;
-- NVL()
select first_name imie, last_name nazwisko, salary, bonus, 12*NVL(salary,0)+NVL(bonus,0) from employees;
-- DISTINCT
Pokaż listę numerów departamentów posiadających pracowników naszej organizacji.
select * from departments;
select department_id from employees;
select DISTINCT department_id from employees;

select first_name, last_name, salary
from employees
order by 3;
select first_name, last_name, salary
from employees
order by 3 desc;
select first_name, last_name, COMMISSION_PCT
from employees
order by 3;
select first_name, last_name, COMMISSION_PCT
from employees
order by 3 nulls first;
select first_name, last_name, COMMISSION_PCT
from employees
order by 3 desc;
select first_name, last_name, COMMISSION_PCT
from employees
order by 3 desc nulls last;
Pokaż i, n, s, b posortuj wg bonusu malejąco, bonusy null na końcu, nast wg sal rosnąco.
select first_name, last_name, salary, bonus from employees
order by 4 desc nulls last, 3; 
-- between and
-- in
Pokaż i, n, s pracownikow zarabiajacych pomiedzy 8000 a 12000
select first_name, last_name, salary from employees
where salary > 8000 AND salary < 12000;
desc employees;
select first_name, last_name, salary from employees
where salary between 8000.01 and 11999.99;
Pokaż i,n, nr_dept pracownikow z dept 10
select first_name, last_name, department_id from employees
where department_id=10;
Pokaż i,n, nr_dept pracownikow z dept 10 i 30
select first_name, last_name, department_id from employees
where department_id=10 OR department_id=30;
Pokaż i,n, nr_dept pracownikow z dept 10,20, 30, 90
select first_name, last_name, department_id from employees
where department_id=10 OR department_id=20 OR department_id=30 OR department_id=90;
select first_name, last_name, department_id from employees
where department_id IN (10, 20, 30, 90);


Wyświetl wszystkich pracowników których przełożonym jest manager o id 123 (z tabeli employees)
select first_name, last_name from employees where manager_id=123;
Wyświetl wszystkich pracowników zarabiających więcej niż 8000 rocznie.
select first_name, last_name from employees where salary > 8000;
Wyświetl wszystkich pracowników których miesięczne przychody są większe niż 1100 dolarów
select first_name, last_name from employees where NVL(salary,0)/12>1100;
Wyświetl wszystkich którzy zarabiają więcej niż 9 tyś ale mniej niż 13 tyś rocznie.
select first_name, last_name from employees where salary > 9000 and salary <13000;
Wyświetl wszystkich którzy zarabiają miesięcznie więcej niż 800$ ale mniej niż 1200$.
select first_name, last_name from employees where NVL(salary,0)/12>800 and NVL(salary,0)/12<1200;
Wyświetl wszystkich pracowników których imię kończy się na a.
select first_name, last_name from employees where first_name like '%a';
Wyświetl wszystkich których imienia mają w środku literę a.
select first_name, last_name from employees where first_name like '_%a%_';
Wyświetl tych których przełożonymi są managerowie o id 100 i 123.

select first_name, last_name, upper (first_name), lower (last_name) from employees;
select initcap('aDaSaX'), 'aDaSaX' from dual;
Uzupenij imiona do 20 znaków po lewej i do 20 po prawej znakiem '.'
select first_name, LPAD (first_name, 20, '.'), RPAD (first_name, 20, '.') from employees; 
-- Substr (text, m [,n]) 
||
-- ||
select first_name||last_name from employees; 
select first_name||last_name, substr(first_name||last_name, 5), substr(first_name||last_name, 5, 3), substr(first_name||last_name, -5,3) from employees; 
Podmień imiona w taki sposób ze jak jest 'na' to zamień na 'NO'.
select first_name, replace(first_name, 'na', 'NO') from employees;
Podmień imiona w taki sposób ze jak jest 'a' to zamień na '.A.'.
select first_name, replace(first_name, 'a', '.A.') from employees;
Podmien samogloski aeoui w imionach na duże.
select first_name, translate(first_name, 'aeoui', 'AEOUI') from employees;
Utworz dla kazdego pracownika tajny kryptonim (Andrzej Żurawski 9000 -> "..zejRA900"







L2

Pokaz i, n, wynagrodzenie w formacie z walutą i 2 miejsca po przecinku.
select first_name, last_name, salary, to_char (salary, 'L09,999.99')
from employees;

select first_name, last_name, salary, to_char (salary, 'L99999.99')
from employees;

select first_name, last_name, salary, to_char (salary, 'L99,999.99')
from employees;
select first_name, last_name, salary, to_char (-salary, '09,999.99MI')
from employees;
select first_name, last_name, salary, to_char (-salary, '09,999.99PR')
from employees;
select first_name, last_name, salary, to_char (salary, '09,999.99MI')
from employees;
Pokaż i,n i kwartal zatrudnienia pracownikow.

select first_name, last_name, hire_date, to_char (hire_date, 'Q')
from employees;
Pokaz i, n, date zatrudnienia w formacie '01 styczen 2021'.
select first_name, last_name, hire_date, to_char (hire_date, 'DD MONTH YYYY')
from employees;
select first_name, last_name, hire_date, to_char (hire_date, 'DD.MONTH.YYYY')
from employees; 
select first_name, last_name, hire_date, replace(to_char (hire_date, 'DD.MONTH.YYYY'),' ','')
from employees; 
Pokaż pracowników zatrudnionych w 2 kwartale.
select first_name, last_name, hire_date
from employees
where to_char (hire_date, 'Q')=2;

Pokaż pracowników zatrudnionych w lipcu
select first_name, last_name, hire_date
from employees
where to_char (hire_date, 'MM')=7;
select first_name, last_name, hire_date
from employees
where replace(to_char (hire_date, 'MONTH'),' ','')='LIPIEC';
select first_name, last_name, hire_date
from employees
where to_char (hire_date, 'MON')='LIP';

Pokaż pracowników zatrudnionych we wtorek
select first_name, last_name, hire_date
from employees
where to_char (hire_date, 'D')=2;
select first_name, last_name, salary/12, round(salary/12),round(salary/12,2), round(salary/12,-2), trunc(salary/12)
from employees;
Select to_char(sysdate,'D, DD MONTH YY, HH24:MI:SS') from dual;
- miesiac, rok, godzina
select to_char(sysdate, 'MM, YY, HH24') from dual;
- rok2.miesiac2.dzien2
select to_char(sysdate, 'yy.mm.dd') from dual;
- dzień 2 miesiac slownie, kwartal, dzień w roku
select to_char(sysdate, 'dd month, Q, ddd') from dual;

MONTHS_BETWEEN - zwraca ilość miesięcy pomiędzy datami.
Za ile miesiecy będzie mikolaj? 6 grudzień 2021
select * from employees;
select months_between ('21/12/06', sysdate) from dual;
select to_date('6 grudzień 2021','DD MONTH YYYY') from dual;
select months_between (to_date('6 grudzień 2021','DD MONTH YYYY'), sysdate) from dual;
Za ile miesiecy będzie mikolaj? 6.12.2021. Odpowiedź zaprezentuj jako pelne zdanie po polsku.
Kolumne nazwij Odpowiedz. 'Mikolaj bedzie za 1.55 miesiecy.'
select 'Mikolaj bedzied za '||round(months_between(to_date('6.12.2021','dd.mm.yyyy'), sysdate),2)||' miesiecy.' AS odpowiedz from dual;
ADD_MONTHS - dodaje do podanej daty n miesięcy.
Za 3 miesiace dostane 1000zl. Kiedy to będzie?
select ADD_MONTHS (sysdate, 3) from dual;
LAST_DAY - zwraca datę ostatniego dnia miesiąca zawierającego podaną datę.
Jaka datę ma ostatni dzien biezacego miesiaca?
select LAST_DAY(sysdate) from dual;
Jaką datę ma ostatni dzien nastepnego miesiaca?
select LAST_DAY(ADD_months(sysdate,1)) from dual;

select LAST_DAY(LAST_DAY(sysdate)+1) from dual;
select ADD_months(to_date('30.01.2021','dd.mm.yyyy'),1) from dual;
select Round (sysdate,'month') from dual;
select trunc (sysdate,'month') from dual;
select Round (sysdate, 'year') from dual;
select trunc (sysdate, 'year') from dual;
Pokaz i, n oraz dziesieciolecie zatrudnienia prac. (80-te, 90-te, 00-te).
select first_name as imie, last_name as nazwisko, to_char(trunc(to_char (hire_date, 'yy'),-1),'09')||'-te' as dziesieciolecie from employees;










L3

select * from employees;
select count(*) from employees;
select count(bonus) from employees;
select count(COMMISSION_PCT) from employees;
select avg(salary) from employees;
select min(salary) from employees;
select max(salary) from employees;
select sum(salary) from employees;

Ilu pracowników pracuje jako MK_REP, ST_CLERK, IT_PROG? [1,4,3]
select first_name from employees where job_id='MK_REP';

select count(*) from employees where job_id='MK_REP';
select count(*) from employees where job_id='ST_CLERK';
select count(*) from employees where job_id='IT_PROG';

Unikalne stanowiska:
select distinct job_id from employees;
Zliczanie wg grup:
select job_id, count(*)
from employees
group by job_id;

Ilu pracowników pracuje jako MK_REP, ST_CLERK, IT_PROG? [1,4,3]
select job_id
from employees
where job_id in ('MK_REP', 'ST_CLERK', 'IT_PROG');

select job_id,count(*)
from employees
where job_id in ('MK_REP', 'ST_CLERK', 'IT_PROG')
group by job_id;
Ilu pracowników mają nasi managerowie i ile im placa srednio?
select manager_id, count(*), avg(salary)
from employees
group by manager_id;
Ilu pracowników mają nasi managerowie w podziale na wg pierwszej litery imienia.
select manager_id, substr(first_name, 1,1), count(*)
from employees
group by manager_id, substr(first_name, 1,1)
order by 1,2;
Ilu pracowników korzysta z telefonow wg nr kier (pierwsza cyfra numeru) i wg incjal im.
select substr(phone_number,1,1), substr(first_name, 1,1), count(*)
from employees
group by substr(phone_number,1,1), substr(first_name, 1,1)
order by 1,2;
Pokaż średnie wynagrodzenie wg miesiaca zatrudnienia i departamentu.
select to_char(hire_date,'MM'), department_id, avg(salary)
from employees
group by to_char(hire_date,'MM'), department_id
order by 1,2;
Pokaż liczbę pracowników wg managera i wieku zatrudnienia.
select manager_id, trunc((to_char(hire_date,'YYYY')-1)/100)+1, count(*)
from employees
group by manager_id, trunc((to_char(hire_date,'YYYY')-1)/100)+1;
Pokaz w porzadku malejacym najnizsze wynagrodzenia wg departamentow.
select department_id, min(salary) 
from employees
group by department_id
order by 2 desc;
Pokaż maksymalne wynagrodzenie wg dnia tygodnia zatrudnienia.
select to_char(hire_date,'D'), max(salary)
from employees
group by to_char(hire_date,'D') 
order by 1;
Pokaż maksymalne wynagrodzenie wg dnia tygodnia zatrudnienia dla osób zatrudnionych w dni parzyste miesiąca.
select to_char(hire_date,'D'), max(salary)
from employees
where mod(to_char(hire_date,'DD'),2)=0
group by to_char(hire_date,'D') 
order by 1;
Pokaż liczbę pracowników zatrudnianych wg kwartalów.
select to_char(hire_date,'Q'), count(*)
from employees
group by to_char(hire_date,'Q');
Oblicz wartość funduszu wynagrodzeń (roczny) na ktory sklada sie wynagodzenie podstawowe oraz bonus.
select sum(salary)*12+sum(bonus)
from employees;
Pokaż liczbę pracowników wg polrocza zatrudnienia.
select round(to_char(hire_date,'Q')/2), count(*)
from employees
group by round(to_char(hire_date,'Q')/2);
Pokaz liczbe pracownikow i średnie wynagrodzenie wg roku zatrudnienia.
select to_char(hire_date,'YYYY'), count(*), avg(salary)
from employees
group by to_char(hire_date,'YYYY');
Pracowników zarabiajacych rocznie > 60000 pogrupować wg managerów i policzyć.
select manager_id, count(*)
from employees
where salary > 5000
group by manager_id;

Pogrupuj prac wg 2 litery imienia i policz najwyższe wynagrodzenie.
select substr(first_name,2,1), max(salary)
from employees
group by substr(first_name,2,1);



 
L4
select * from employees;
SELECT first_name, last_name,
DECODE(department_id, 
90, 'Grube ryby',
60, 'Komputerowcy',
'Pozostali') GRUPKA
FROM employees;
select DECODE(department_id, 
90, 'Grube ryby',
60, 'Komputerowcy',
'Pozostali') GRUPKA, count(*)
from employees
group by DECODE(department_id, 
90, 'Grube ryby',
60, 'Komputerowcy',
'Pozostali');
select first_name, last_name, 
case department_id 
when 90 then 'Grube ryby'
when 60 then 'Komputerowcy'
else 'Pozostali'
end 
from employees;
select first_name, last_name, 
case department_id 
when 90 then 'Grube ryby'
when 60 then 'Komputerowcy'
else 'Pozostali'
end GRUPKA
from employees;
Pokaż liczby pracowników zatrudnionych Zimą (grudzień - luty) oraz w pozostaych miesiącach.
select 
case to_char(hire_date, 'MM') 
when '12' then 'Zimowiec' 
when '01' then 'Zimowiec' 
when '02' then 'Zimowiec' 
else 'NieZimowiec' end, count(*)
from employees
group by case to_char(hire_date, 'MM') 
when '12' then 'Zimowiec' 
when '01' then 'Zimowiec' 
when '02' then 'Zimowiec' 
else 'NieZimowiec' end;
select case 
when to_char(hire_date,'MM') in ('01','02','12') then 'Zima'
else 'nieZima' end OKRES , count(*)
from employees
group by case when to_char(hire_date,'MM') in ('01','02','12') then 'Zima'
else 'nieZima' end;
Pokaż liczbę pracowników zatrudnionych w parzystych i nieparzystych miesiącach.
select 
case when to_char(hire_date,'MM')/2 in (1,2,3,4,5,6) then 'parzysty' else 'nieparzysty' end,
count(*)
from employees
group by case when to_char(hire_date,'MM')/2 in (1,2,3,4,5,6) then 'parzysty' else 'nieparzysty' end;
select case mod(to_char(hire_date,'MM'), 2) when 0 then 'parzyste' else 'nieparzyste' end, count(*)
from employees
group by case mod(to_char(hire_date,'MM'), 2) when 0 then 'parzyste' else 'nieparzyste' end;
-- rollup , cube
Pokaż liczbę pracowników zatrudnionych wg departamentu oraz pórocza zatrudnienia.
select department_id, decode (to_char(hire_date,'Q'), 1,'1H',2,'1H','2H') ,count(*)
from employees
group by 
department_id, 
decode (to_char(hire_date,'Q'), 1,'1H',2,'1H','2H')
order by 1,2;
select department_id, decode (to_char(hire_date,'Q'), 1,'1H',2,'1H','2H') ,count(*)
from employees
group by 
department_id, 
rollup(decode (to_char(hire_date,'Q'), 1,'1H',2,'1H','2H'))
order by 1,2;
select NVL(department_id, 9999), decode (to_char(hire_date,'Q'), 1,'1H',2,'1H','2H') ,count(*)
from employees
group by 
rollup( NVL(department_id,9999), 
decode (to_char(hire_date,'Q'), 1,'1H',2,'1H','2H'))
order by 1,2;

select NVL(department_id, 9999), decode (to_char(hire_date,'Q'), 1,'1H',2,'1H','2H') ,count(*)
from employees
group by 
CUBE( NVL(department_id,9999), 
decode (to_char(hire_date,'Q'), 1,'1H',2,'1H','2H'))
order by 1,2;

-- having 
Wyświetl średnie wynagrodzenia wg kwartalow zatrudnienia uwzględniając średnie przekraczające 5000.
SELECT TO_CHAR(HIRE_DATE, 'Q'), ROUND(AVG(SALARY))
FROM EMPLOYEES
GROUP BY TO_CHAR(HIRE_DATE, 'Q')
HAVING ROUND(AVG(SALARY))>5000;
Wyświelt średnie wynagrodzenia wg departamentów uwzględniając tylko pracowników zarabiających poniżej 10000.
select department_id, ROUND(AVG(SALARY))
from employees
where salary < 10000
group by department_id;
select department_id, salary from employees;

Pokaż depart i śr bez prac >10k i gdzie śr >5000.
select department_id, ROUND(AVG(SALARY))
from employees
where salary < 10000
group by department_id
having ROUND(AVG(SALARY))>5000;

-- union all, union, minus, intersect
Pokaż pracowników imię z dzialu IT (60).
select first_name from employees where department_id=60;
3
Pokaż pracowników imię zarabiających >10000.
select first_name from employees where salary>10000;
7

Pokaż pracowników z dziau it lub zarabiających >10000;
select first_name from employees where department_id=60 or salary>10000;
select first_name from employees where department_id=60
UNION 
select first_name from employees where salary>10000;
select first_name from employees where department_id=60
UNION 
select first_name from employees where salary>8000;
select first_name from employees where department_id=60
UNION ALL 
select first_name from employees where salary>8000;

select first_name, department_id, salary from employees where department_id=60 or salary>8000
order by 2;
Pokaż raport zawierający pracowników zarabaijących powyżej 8000 i nie pracujących w IT.
select first_name from employees where salary>8000
MINUS
select first_name from employees where department_id=60;
select first_name from employees where salary>8000 AND department_id<>60;
Pokaż raport wyglądający jak poniżej:
NR dept Wskaźnik Wartość wskaźnika
10 Liczba pracowników 1
10 Średnia pensja 4400
20 Liczba pracowników 2
20 Średnia pensja 9500
50 Liczba pracowników 5
50 Średnia pensja 3500
...
-- dzielimy na dwa prote raporty
NR dept Wskaźnik Wartość wskaźnika
100 Liczba pracowników 3
10 Liczba pracowników 3
20 Liczba pracowników 3

select department_id "NR DEPT", 'Liczba pracowników' "Wskaźnik", count(*) "Wartość wskaźnika"
from employees
group by department_id;
100 Średnia pensja 10 000
10 Średnia pensja 10 000
20 Średnia pensja 10 000
select department_id , 'Średnia pensja', round(avg(salary))
from employees
group by department_id;

select department_id "NR DEPT", 'Liczba pracowników' "Wskaźnik", count(*) "Wartość wskaźnika"
from employees
group by department_id
UNION
select department_id , 'Średnia pensja', round(avg(salary))
from employees
group by department_id
order by 1,2;
Praca domowa
Wyświetl średnie zarobki podsumowując je wg. managerów dla każdego działu oddzielnie.
Wyświetl średnie zarobki podsumowując je wg. managerów dla każdego działu oddzielnie 
z jednoczesnym podsumowaniem średnich zarobków osób podległych pod jednego managera.
Wyświetl średnie zarobki podsumowując je wg. managerów dla każdego działu oddzielnie 
z jednoczesnym podsumowaniem średnich zarobków osób podległych pod jednego managera 
i podsumowaniem średnich zarobków osób z jednego działu.

 
L5
1. Wyświetl średnie zarobki podsumowując je wg. managerów dla każdego działu oddzielnie.
select NVL(manager_id, 6666), NVL(department_id, 9999), round(avg(salary))
from employees
group by NVL(manager_id, 6666), NVL(department_id, 9999)
order by 1,2; 
2. Wyświetl średnie zarobki podsumowując je wg. managerów dla każdego działu oddzielnie 
z jednoczesnym podsumowaniem średnich zarobków osób podległych pod jednego managera.
select NVL(manager_id, 6666), NVL(department_id, 9999), round(avg(salary))
from employees
group by NVL(manager_id, 6666), rollup(NVL(department_id, 9999))
order by 1,2; 

select NVL(department_id,9999), NVL(manager_id,9999), avg(salary)
from employees
group by NVL(department_id,9999), NVL(manager_id,9999)
UNION ALL
select NVL(department_id,9999), NVL(manager_id,9999), avg(salary)
from employees
group by cube(NVL(department_id,9999), NVL(manager_id,9999))
having nvl(department_id,9999) is NULL AND nvl(manager_id,9999) is not NULL
order by 1,2;

3. Wyświetl średnie zarobki podsumowując je wg. managerów dla każdego działu oddzielnie
z jednoczesnym podsumowaniem średnich zarobków osób podległych pod jednego managera
i podsumowaniem średnich zarobków osób z jednego działu.

select NVL(manager_id,1111), NVL(department_id,9999),round(AVG(salary))
from employees
group by cube(NVL(manager_id,1111),NVL(department_id,9999))
order by 1;
select NVL(manager_id,1111), NVL(department_id,9999),round(AVG(salary))
from employees
group by cube(NVL(manager_id,1111),NVL(department_id,9999))
having NVL(manager_id,1111) is not null or NVL(department_id,9999) is not null
order by 1;
select * from regions;
select * from COUNTRIES;
(5) * (4);
select countries.COUNTRY_NAME, regions.REGION_NAME
from countries, regions;

select countries.COUNTRY_NAME, regions.REGION_NAME
from countries, regions
where countries.REGION_ID=regions.REGION_ID;
select countries.COUNTRY_NAME, regions.REGION_NAME
from countries JOIN regions ON countries.REGION_ID=regions.REGION_ID;
select countries.COUNTRY_NAME AS "Tabela A", countries.REGION_ID "Klucz A", regions.REGION_ID "Klucz B", regions.REGION_NAME "Tabela B"
from countries JOIN regions ON countries.REGION_ID=regions.REGION_ID;
select countries.COUNTRY_NAME AS "Tabela A", countries.REGION_ID "Klucz A", regions.REGION_ID "Klucz B", regions.REGION_NAME "Tabela B"
from countries LEFT JOIN regions ON countries.REGION_ID=regions.REGION_ID;
select countries.COUNTRY_NAME AS "Tabela A", countries.REGION_ID "Klucz A", regions.REGION_ID "Klucz B", regions.REGION_NAME "Tabela B"
from countries RIGHT JOIN regions ON countries.REGION_ID=regions.REGION_ID;
select countries.COUNTRY_NAME AS "Tabela A", countries.REGION_ID "Klucz A", regions.REGION_ID "Klucz B", regions.REGION_NAME "Tabela B"
from countries FULL JOIN regions ON countries.REGION_ID=regions.REGION_ID;
select countries.COUNTRY_NAME,countries.REGION_ID, regions.REGION_ID, regions.REGION_NAME
from countries FULL JOIN regions ON countries.REGION_ID=regions.REGION_ID;

select countries.COUNTRY_NAME, regions.REGION_NAME
from countries LEFT JOIN regions ON countries.REGION_ID=regions.REGION_ID
where regions.REGION_ID is NULL;
select countries.COUNTRY_NAME, regions.REGION_NAME
from countries RIGHT JOIN regions ON countries.REGION_ID=regions.REGION_ID
where countries.REGION_id is null;
select countries.COUNTRY_NAME, regions.REGION_NAME
from countries FULL JOIN regions ON countries.REGION_ID=regions.REGION_ID
where regions.REGION_ID is NULL OR countries.REGION_id is null;

Pokaż liste pracownikow (i i n) oraz nazwe departamentu, w ktoreym pracuje.
select employees.first_name, employees.last_name, departments.department_name
from employees join departments on employees.department_id=departments.department_id;

Pokaż liste wszystkich pracownikow (i i n) oraz nazwe departamentu, w ktoreym pracuje (lacznie z nieprzypisanymi pracownikami).
select employees.first_name, employees.last_name, departments.department_name
from employees left join departments on employees.department_id=departments.department_id;
Pokaż liste pracowników (i i n) nieprzypisanych do departamentów.
select count(*) from departments;
select department_name from departments;
select employees.first_name, employees.last_name, departments.department_name
from employees left join departments on employees.department_id=departments.department_id
where departments.department_id is null;

Pokaż departamenty bez pracowników.
select employees.first_name, employees.last_name, departments.department_name
from employees right join departments on employees.department_id=departments.department_id
where employees.department_id is null;
select e.first_name, e.last_name, d.department_name
from employees e right join departments d on e.department_id=d.department_id
where e.DEPARTMENT_ID is NULL;
select first_name, last_name, department_name
from employees e right join departments d on e.department_id=d.department_id
where e.DEPARTMENT_ID is NULL;

Pokaż nazwy wszystkich departamentow i liczbę pracowników, ktorzy w nich w pracują.
select department_name, count(employee_id)
from departments d left join employees e on e.department_id=d.department_id
group by rollup(d.department_name);
select department_name, first_name, last_name
from departments d left join employees e on e.department_id=d.department_id;

Pokaż wszystkie departamnety nazwy, policz pracownikow (nieprzyporzadkowanych również) 
i średnie wynagrodzenia w departamentach i średnia w calej firmie.
select department_name, count(employee_id), round(avg(salary))
from employees e full join departments d on e.department_id=d.department_id
group by rollup(department_name);

select nvl(department_name, 'brak dept'), count(employee_id) as "Liczba pracownikow", round(avg(salary)) "Średnie wynagrodzenie"
from departments d right join employees e on e.department_id=d.department_id
group by rollup(nvl(department_name, 'brak dept'));

 
L6
select * 
from 
locations full join COUNTRIES using (country_id);
select * 
from 
countries full join regions using (region_id);
select * from 
locations 
join COUNTRIES using (country_id)
join regions using (region_id);
select * from 
locations 
FULL join COUNTRIES using (country_id)
LEFT join regions using (region_id);

select * from 
locations 
FULL join COUNTRIES using (country_id)
RIGHT join regions using (region_id);

select * from 
locations 
FULL join COUNTRIES using (country_id)
join regions using (region_id);
select * from 
locations 
left join COUNTRIES using (country_id)
right join regions using (region_id);
select * from 
locations 
right join COUNTRIES using (country_id)
left join regions using (region_id);
select * from 
locations 
right join COUNTRIES using (country_id)
full join regions using (region_id);
select * from 
locations 
join COUNTRIES c using (country_id)
join regions r on r.region_id=c.region_id;
select * from 
locations 
LEFT join COUNTRIES c using (country_id)
RIGHT join regions r on r.region_id=c.region_id;
Pokaz liste i, n, nazwa regionu dla pracownikow.

select first_name, last_name, nvl(region_name,'brak regionu')
from employees
left join departments using (department_id)
LEFT join locations using (location_id)
LEFT join countries using (country_id)
left join regions using (region_id);
-- zly pomysl
select first_name, last_name, nvl(region_name,'brak regionu')
from employees
FULL join departments using (department_id)
FULL join locations using (location_id)
full join countries using (country_id)
full join regions using (region_id);
select count(*), round(avg(salary)), nvl(region_name,'brak regionu')
from employees
left join departments using (department_id)
left join locations using (location_id)
left join countries using (country_id)
left join regions using (region_id)
group by nvl(region_name,'brak regionu');
select count(employee_id), round(avg(salary)), region_name
from employees
full join departments using (department_id)
full join locations using (location_id)
full join countries using (country_id)
full join regions using (region_id)
group by region_name;

Pokaż liczbę i widelki wynagrodzen wg miast. Oznacz "brak miasta".

select count(employee_id), min(salary), max(salary), nvl(city,'brak miasta')
from locations 
right join departments using (location_id)
right join employees using (department_id)
group by nvl(city,'brak miasta');

Pokaż liczbę i średnie wynagrodzen wg miast. Oznacz "brak miasta". 
select count(employee_id), round(avg(salary)), nvl(city,'brak miasta')
from locations 
right join departments using (location_id)
right join employees using (department_id)
group by nvl(city,'brak miasta');
Policz wskażnik jak dana srednia ma sie w procentach do sredniej w calej firmie.
8775
select avg(salary) from employees;

select count(employee_id), round(avg(salary)), nvl(city,'brak miasta'),round(avg(salary)/8775*100) 
from locations 
right join departments using (location_id)
right join employees using (department_id)
group by nvl(city,'brak miasta');

select count(employee_id), round(avg(salary)), nvl(city,'brak miasta'),round(avg(salary)/(select avg(salary) from employees)*100) 
from locations 
right join departments using (location_id)
right join employees using (department_id)
group by nvl(city,'brak miasta');

select employee_id, first_name, last_name, manager_id from employees;
select e1.first_name "I prac", e1.last_name "N prac", e2.first_name "I szefa", e2.last_name "N szefa" 
from employees e1 -- tu sa prac 
left join employees e2 ON e1.manager_id = e2.employee_id; --tu sa szefowie

select e1.first_name "I prac", e1.last_name "N prac", e1.manager_id 
from employees e1; -- tu sa prac 

-- Pat --> 201
select e2.first_name "I szefa", e2.last_name "N szefa" 
from employees e2
where e2.employee_id=201;
select e1.first_name "I prac", e1.last_name "N prac", e1.manager_id, (select e2.first_name ||' ' ||e2.last_name "N szefa" 
from employees e2
where e2.employee_id=e1.manager_id) 
from employees e1; -- tu sa prac 

select e1.first_name "I prac", 
e1.last_name "N prac", 
(select e2.first_name from employees e2 where e2.employee_id=e1.manager_id) "I szefa",
(select e2.last_name from employees e2 where e2.employee_id=e1.manager_id) "N szefa"
from employees e1; -- tu sa prac 

 
L7
Lista pracowników oraz ich poziom zaszeregowania.
select * from job_grades;
select first_name, last_name, salary from employees;
select first_name, last_name, grade_level 
from employees join job_grades ON salary BETWEEN lowest_sal AND highest_sal;
Oblicz średnie wynagrodzenie pracowników na każdym poziomie zaszeregowania.
select grade_level, avg(salary) 
from employees join job_grades ON salary BETWEEN lowest_sal AND highest_sal
group by grade_level;
ZADANIA
1. Pokaż raport zawierający imiona i nazwiska pracowników oraz nazwę departamentu, w którym pracują.
select first_name, last_name, department_name from employees join departments using(department_id);
2. Pokaż raport zawierający imię i nazwisko pracownika oraz nazwę departamentu i miasto, w którym pracuje.
select first_name as imię, last_name as nazwisko, nvl(city,'Brak miasta') as miasto, nvl(department_name, 'Brak departamentu') as departament from employees
left join departments using (department_id)
LEFT join locations using (location_id);
3. Pokaż raport zawierający nazwę departamentu (wszystkie) oraz imię i nazwisko jego szefa.
select department_name, first_name, last_name from departments d
left join employees e on d.manager_id=e.employee_id;
4. Pokaż imię i nazwisko pracownika oraz pseudonim jego szefa (pseudonim AZurawski).
select e1.first_name ip, e1.last_name, substr(e2.first_name, 1,1)||e2.last_name
from employees e1 left join employees e2 ON e1.manager_id=e2.employee_id;

5. Pokaż średnie wynagrodzenia zatrudnionych pracowników wg krajów. (Kraj, śr wyn). Pokaż wszystkie kraje.
select round(avg(salary)), nvl(country_name,'brak kraju')from employees
full join departments using (department_id)
full join locations using (location_id)
full join countries using (country_id)
group by nvl(country_name,'brak kraju');
select avg(salary), country_name from employees
right join departments using (department_id)
right join locations using (location_id)
right join countries using (country_id)
group by country_name;
6. Pokaż średnie wynagrodzenia zatrudnionych pracowników wg krajów i miast wraz z podsumowaniem dla krajów. 
Posortuj elegancko. (Kraj, miasto, śr wyn)
select nvl(country_name, 'brak kraju'), nvl(city, 'brak miasta'), round(avg(salary))
from employees
left join departments using (department_id)
left join locations using (location_id)
left join countries using (country_id)
group by nvl(country_name, 'brak kraju'), rollup(nvl(city, 'brak miasta'));

7. Wyświetl id departamentu oraz miasto w którym ten departament się znajduje. 
Wyświetl sumę zarobków w tych miastach, z podziałem na departamenty.
Uwzględnij tylko te departamenty, w których się zarabia w sumie więcej niż 20 000 miesięcznie.
select departments.department_id, locations.city
from departments, locations
where departments.location_id=locations.location_id;
select city, department_id, sum(salary)
from employees 
left join departments using (department_id) 
left join locations using (location_id)
group by city, department_id
having sum(salary) >20000;
8. Pokaż i,n,wynagrodzenie pracownika, śr w dept, śr w mieście, śr w kraju.

select first_name, last_name, salary,
(select round(avg(salary)) 
from employees e2 where e2.department_id=e1.department_id) "sr w dept", 
(select round(avg(salary)) 
from employees e2
join departments d2 on e2.department_id=d2.department_id
join locations l2 on l2.location_id=d2.location_id
where l2.city=l1.city) "sr w city", 
(select round(avg(salary)) 
from employees e2
join departments d2 on e2.department_id=d2.department_id
join locations l2 on l2.location_id=d2.location_id
where l2.country_id=l1.country_id) "sr w country"
from employees e1
left join departments d1 on e1.department_id=d1.department_id
left join locations l1 using (location_id);
--steven king 90, Toronto, UK
select round(avg(salary)) from employees where department_id=90;
select round(avg(salary)) 
from employees e2
join departments d2 on e2.department_id=d2.department_id
join locations l2 on l2.location_id=d2.location_id
where l2.city='Toronto';
select round(avg(salary)) 
from employees e2
join departments d2 on e2.department_id=d2.department_id
join locations l2 on l2.location_id=d2.location_id
where l2.country_id='UK';

9. Pokaż nazwisko, wynagrodzenie i miasto pracownika oraz średnie wynagrodzenie w mieście.
select last_name, salary, city,
(select round(avg(salary)) 
from employees e2
join departments d2 on e2.department_id=d2.department_id
join locations l2 on l2.location_id=d2.location_id
where l2.city=l1.city) "sr w city"
from employees e1
left join departments d1 on e1.department_id=d1.department_id
left join locations l1 using (location_id);
10. Pokaż nazwisko pracownika, jego wynagrodzenie oraz wskaźnik, ktory 
informuje jakim % sredniej w kraju jest wynagrodzenie danego pracownika 
oraz wskaźnik, który informuje jakim % średniej w firmie jest wynagrodzenie danego pracownika.
select last_name, salary,

round(100*salary/(select round(avg(salary)) 
from employees e2
join departments d2 on e2.department_id=d2.department_id
join locations l2 on l2.location_id=d2.location_id
where l2.country_id=l1.country_id)) "proc wsk do sr w country",

round(100*salary/(select avg(salary) from employees)) "proc wsk do sr w firma"
from employees e1
left join departments d1 on e1.department_id=d1.department_id
left join locations l1 using (location_id);
11. Oblicz dla każdego pracownika wysokość podwyżki, aby jego wynagrodzenie wyrównać do średniej w departamencie przed tą podwyżką.
12. Pokaż pracowników zarabiających powyżej jednokrotności średniej w ich mieście.
13. Pokaż pracowników zarabiających powyżej dwukrotności minimalnej w ich kraju.
14. Oblicz dla każdego kraju wskaźnik % pokazujący stosunek średniego wynagrodzenia w tym kraju do średniej w calej firmie.
15. Oblicz dla każdego miasta wskaźnik % pokazujący stosunek średniego wynagrodzenia w tym mieście do średniej w Kanadzie.

 
L8
11. Oblicz dla każdego pracownika wysokość podwyżki, aby jego wynagrodzenie wyrównać do średniej 
w departamencie przed tą podwyżką.
select first_name, last_name, salary, e1.department_id,
(select round(avg(salary)) 
from employees e2 
where e2.department_id=e1.department_id) srednia_dep,
case 
when (nvl((select round(avg(salary)) from employees e2 where e2.department_id=e1.department_id),0)-salary)>0 then
(nvl((select round(avg(salary)) from employees e2 where e2.department_id=e1.department_id),0)-salary)
else 0 
end podwyzka
from employees e1;
select first_name, last_name, salary, e1.department_id,
(select round(avg(salary)) 
from employees e2 
where e2.department_id=e1.department_id) srednia_dep, 
(nvl((select round(avg(salary)) from employees e2 where e2.department_id=e1.department_id),0)-salary) podw
from employees e1
where (nvl((select round(avg(salary)) from employees e2 where e2.department_id=e1.department_id),0)-salary)>0;
12. Pokaż pracowników zarabiających powyżej jednokrotności średniej w ich mieście.
select first_name, last_name, salary,
( select round(avg(salary))
from employees e2
left join departments d2 using (department_id)
left join locations l2 using (location_id)
where l2.city=l1.city) "srednia w miescie"
from employees e1
left join departments d1 on e1.department_id=d1.department_id
left join locations l1 using (location_id)
where salary >
( select round(avg(salary))
from employees e2
left join departments d2 using (department_id)
left join locations l2 using (location_id)
where l2.city=l1.city);
13. Pokaż pracowników zarabiających powyżej dwukrotności minimalnej w ich kraju.
select first_name as "imie", last_name as "nazwisko", salary as "wynagrodzenie", country_name as "kraj",
(select(min(salary)) from employees e2
join departments d2 on e2.department_id=d2.department_id
join locations l2 on d2.location_id=l2.location_id
join countries c2 on l2.country_id=c2.country_id
where c2.country_name=c1.country_name) "minimalna w kraju"
from employees e1
left join departments d1 on e1.department_id=d1.department_id
left join locations l1 on d1.location_id=l1.location_id
left join countries c1 on l1.country_id=c1.country_id
where salary>2*(select(min(salary)) from employees e2
join departments d2 on e2.department_id=d2.department_id
join locations l2 on d2.location_id=l2.location_id
join countries c2 on l2.country_id=c2.country_id
where c2.country_name=c1.country_name);
14. Oblicz dla każdego kraju wskaźnik % pokazujący stosunek średniego wynagrodzenia w tym kraju do średniej w calej firmie.
select round(avg(salary)),
nvl(country_name,'brak kraju'),
round(avg(salary)/(select avg(salary) from employees)*100)
from countries
right join locations using (country_id)
right join departments using (location_id)
right join employees using (department_id)
group by nvl(country_name,'brak kraju');
select country_name as "kraj",
round((100*(select(avg(salary)) from employees e2
join departments d2 on e2.department_id=d2.department_id
join locations l2 on d2.location_id=l2.location_id
join countries c2 on l2.country_id=c2.country_id
where c2.country_id=c1.country_id)/(select (avg(salary)) from employees))) "wskaznik"
from countries c1;

15. Oblicz dla każdego miasta wskaźnik % pokazujący stosunek średniego wynagrodzenia w tym mieście do średniej w Kanadzie.
select city, round(100*nvl(avg(salary),0)/(select avg(salary) 
from employees e2
left join departments d2 using (department_id)
left join locations l2 using (location_id)
left join countries c2 using (country_id) 
where country_name='Canada'),2) "wskaźnik %"
from locations l1 
left join departments d1 using (location_id)
left join employees e1 using (department_id)
group by city;

Pokaż nazwiska pracownikow, którzy pracuja w departamentach zatrudniajacych wiecej niz 2 osoby.
select last_name from employees
where department_id in (select department_id from employees
group by department_id having count(employee_id)>2);
Pokaż nazwiska pracowników, którzy zarabiają najmniej w każdym departamencie.
select first_name, last_name, department_id
from employees e1
where salary = (select min(salary) from
employees e2
where e2.department_id=e1.department_id);
Pokaż nazwiska pracowników, którzy zarabiają najmniej w każdym mieście.

CREATE TABLE
copy_employees
AS (SELECT * FROM employees);

Utwórz tabelę zawieraja kolumny ID, Imię, Nazwisko, wynagrodzenie, stanowisko
CREATE TABLE
copy2_employees
AS (SELECT employee_id as "ID", first_name "Imię", last_name "Nazwisko", salary "wynagrodzenie", job_id "stanowisko" 
FROM employees
WHERE job_id like '%REP%');
SELECT employee_id as "ID", first_name "Imię", last_name "Nazwisko", salary "wynagrodzenie", job_id "stanowisko" 
FROM employees
WHERE job_id like '%REP%';
select * from copy2_employees;
DESCRIBE copy_employees;
DESCRIBE copy2_employees;

create table copy_departments as (select * from departments); 

describe copy_departments;
select * from copy_departments;
INSERT INTO copy_departments
(department_id , department_name , manager_id , location_id)
VALUES
(200,'Human Resources', 205, 1500);

select * from copy_departments;

INSERT INTO copy_departments
(department_name , manager_id)
VALUES
('Zarzad', 100);

INSERT INTO copy_departments
(department_id , department_name , manager_id , location_id)
VALUES
('','Zarzad 2', 101, '');
INSERT INTO copy_departments
VALUES
(210,'Estate Management', 102, 1700);
INSERT INTO copy_departments
VALUES
('','Zarzadzanie flota', 150, 1500);

select * from copy_departments;

INSERT INTO copy_employees
(employee_id , first_name , last_name , phone_number , hire_date , job_id, salary)
VALUES
(302,'xxx','yyy', '8586667641', '15 Jun 2015', 'IT_PROG',4200);
describe copy_employees;
INSERT INTO copy_employees
(employee_id , first_name , last_name , phone_number , hire_date , job_id, salary, email)
VALUES
(302,'xxx','yyy', '8586667641', '15 Jun 2015', 'IT_PROG',4200,'x@xx');
select to_char(hire_date, 'DD MON YYYY') from employees;
to_date('15 Jun 2015','DD MON YYYY')
INSERT INTO copy_employees
(employee_id , first_name , last_name , phone_number , hire_date , job_id, salary, email)
VALUES
(302,'xxx','yyy', '8586667641', to_date('15 Cze 2015','DD MON YYYY'), 'IT_PROG' ,4200,'x@xx');

select * from copy_employees;
INSERT INTO copy_employees
(first_name, last_name, hire_date, email, job_id)
VALUES
('x2','y2', SYSDATE, 'kj', 'BOSS');
copy_employees; (first_name, last_name, hire_date, email, job_id); REP
INSERT INTO copy_employees
(first_name, last_name, hire_date, email, job_id)
SELECT
first_name, last_name, hire_date, email, job_id
FROM employees
WHERE
job_id LIKE '%REP%';
select * from copy_employees;
PROG; (first_name, last_name, hire_date, email, job_id); salary 11111; zatrud dziś
INSERT INTO
copy_employees
(first_name, last_name, hire_date, email, job_id, salary)
SELECT
first_name, last_name, SYSDATE, email, job_id, 11111
FROM employees
WHERE
job_id LIKE '%PROG%';
IT_PROG -> programist
UPDATE
copy_employees
SET
job_id = 'programist'
WHERE
job_id = 'IT_PROG';

select * from copy_employees;

wynagrodzenia w dept 50 zostaly po3jone.
UPDATE
copy_employees
SET
salary=3 * salary
WHERE
department_id = 50;
select * from copy_employees;
ustaw wynagrodzenia w dept 60 na wartość średnia w tym dpart
UPDATE
copy_employees
SET
salary= (select avg(salary) from copy_employees where department_id=60)
WHERE
department_id = 60;
select * from copy_employees;
usunac pracownika o id = 124
delete from copy_employees where employee_id=124;
usunac BOSSa
delete from copy_employees where job_id='BOSS';
usunac podwaladnych mgr o id 100
delete from copy_employees where manager_id=100;
usun pracownikow zarabiajacych powyzej sredniej w firmie
delete from copy_employees where salary > (select avg(salary) from copy_employees);
select * from copy_employees;


Zmień pensje podwadnych na sumę średniej w departamencie i pensji przelożonego.
select employee_id, 
nvl((select salary from employees e2 where e2.employee_id=e1.manager_id),0) +
nvl((select round(avg(salary)) from employees e2 where e2.department_id=e1.department_id),0) sumka
from employees e1;
select nvl((select salary from employees e2 where e2.employee_id=e1.manager_id),0) +
nvl((select round(avg(salary)) from employees e2 where e2.department_id=e1.department_id),0) sumka
from employees e1
where e1.employee_id=ce.employee_id;
UPDATE copy_employees ce
SET salary = (select nvl((select salary from employees e2 where e2.employee_id=e1.manager_id),0) +
nvl((select round(avg(salary)) from employees e2 where e2.department_id=e1.department_id),0) sumka
from employees e1
where e1.employee_id=ce.employee_id);

 
L9
SELECT table_name
FROM USER_TABLES;
CREATE TABLE my_cd_collection
(cd_number NUMBER(3),
title VARCHAR2(20),
artist VARCHAR2(20),
purchase_date DATE DEFAULT SYSDATE);
insert into my_cd_collection
values
(1, 'Back to black', 'Amy Winehouse', to_date('1.08.2021','dd.mm.yyyy'));

insert into my_cd_collection
values
(2, '1000 gecs', '100 gecs', to_date('1.08.2020','dd.mm.yyyy'));
insert into my_cd_collection
(title, artist)
values
('AM','Arctic Monkeys');

select * from my_cd_collection;
describe my_cd_collection;

insert into my_cd_collection
values
(4, 'Kwarantanna', 'Chopin', to_date('11-12-2020','dd-mm-yyyy'));
insert into my_cd_collection
(cd_number, title, artist)
values
(8, 'Bajkowe piosenki', 'Edyta Górniak');

select * from my_cd_collection;
cd_number - null
title - imie
artist - nazwisko
purchase date - hiredate
tylko PROG
insert into my_cd_collection
(title, artist, purchase_date)
select first_name, last_name, hire_date from employees;

select title, artist, (select job_id from employees e where e.first_name=mcc.title) from my_cd_collection mcc
where (select job_id from employees e where e.first_name=mcc.title) is not null and (select job_id from employees e where e.first_name=mcc.title) not like '%PROG%';
delete from my_cd_collection mcc
where (select job_id from employees e where e.first_name=mcc.title) is not null and (select job_id from employees e where e.first_name=mcc.title) not like '%PROG%';
insert into my_cd_collection
(title, artist, purchase_date)
select first_name, last_name, hire_date from employees where job_id like '%PROG%';
update my_cd_collection 
set
cd_number = 3
where title = 'Bruce';

update my_cd_collection 
set
cd_number = 99,
artist ='100 gecs'
where title = 'Bruce';

Utwórz tabelę podwyzka (id, podwyzka). 
Wrzuć do niej rekordy dla pracowników z dzialu 50, naliczając wartość podwyżki jako 20% wynagrodzenia ich szefa.
create table podwyzka
(id number(3), podwyzka number(5));
insert into podwyzka
select employee_id, 0.2*(select salary from employees e2 where e2.employee_id = e1.manager_id)from employees e1 where department_id=50;
select * from podwyzka;
Dodaj 2 kolumny imie, nazwisko
alter table podwyzka
add (imie varchar2(20), nazwisko varchar2(20));
Uzupenij imion i nazwiska z employees
update podwyzka p
set
imie= (select first_name from employees e where e.employee_id=p.id),
nazwisko= (select last_name from employees e where e.employee_id=p.id);
usuń kolumnę nazwisko
alter table podwyzka
drop column nazwisko;
usuń tabelę podwyzka.
drop table podwyzka;
VIEW
select first_name, last_name, salary, department_name, city, country_name, region_name
from employees e1 
left join departments d1 on e1.department_id=d1.department_id 
left join locations l1 on d1.location_id=l1.location_id
left join countries c1 on l1.country_id=c1.country_id
left join regions r1 on c1.region_id=r1.region_id;
CREATE VIEW view_employees
AS
select first_name, last_name, salary, department_name, city, country_name, region_name
from employees e1 
left join departments d1 on e1.department_id=d1.department_id 
left join locations l1 on d1.location_id=l1.location_id
left join countries c1 on l1.country_id=c1.country_id
left join regions r1 on c1.region_id=r1.region_id;
select * from view_employees;
1. Pokaż imię, nazwisko, region zatrudnienia pracownika oraz pensje, 
wskaźnik % pensja / sredniej w dept, % pensja / sredniej w miasto, 
% pensja / sredniej w kraj, wskaznik % pensja / sredniej w regionie, pensja / śred w firmie.
select first_name, last_name, region_name, salary,
round(100*salary /(select avg(salary) from view_employees ve2 where ve2.department_name=ve.department_name)) "WSK_dept",
round(100*salary /(select avg(salary) from view_employees ve2 where ve2.city=ve.city)) "WSK_miasto",
round(100*salary /(select avg(salary) from view_employees ve2 where ve2.country_name=ve.country_name)) "WSK_kraj",
round(100*salary /(select avg(salary) from view_employees ve2 where ve2.region_name=ve.region_name)) "WSK_region",
round(100*salary /(select avg(salary) from view_employees ve2 )) "WSK_firma"
from view_employees ve;

 
L10
CREATE SEQUENCE
runner_id_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 50000
NOCACHE
NOCYCLE;
SELECT
sequence_name , min_value , max_value , increment_by , last_number
FROM
user_sequences;
CREATE TABLE runners
( runner_id NUMBER(6,0),
first_name VARCHAR2(30),
last_name VARCHAR2(30));
INSERT INTO runners
(runner_id , first_name , last_name)
VALUES ('' , 'Joanne', 'Everely');

select * from runners;
INSERT INTO runners
(runner_id , first_name , last_name)
VALUES (runner_id_seq.NEXTVAL , 'Adam', 'Kowalski');
INSERT INTO runners
(runner_id , first_name , last_name)
VALUES (runner_id_seq.NEXTVAL , 'Jan', 'Nowak');
INSERT INTO runners
(runner_id , first_name , last_name)
VALUES (runner_id_seq.NEXTVAL , 'Andrzej', 'XXX');

Utwórz kopię tabeli Departments o nazwie Dzialy i przenieś wszystkie dane.
create table Dzialy as (select * from departments);
select * from dzialy;
Utworz sekwencje Numeracja 200->+10.

CREATE SEQUENCE
numeracja
INCREMENT BY 10
START WITH 200
NOMAXVALUE
NOCACHE
NOCYCLE;
Dodaj nastepujace dzialy: HaEr, Kadry, Projekty i ponumeruj je z użyciem sekwencji Numeracja.
INSERT INTO dzialy
(department_id , department_name)
VALUES (numeracja.NEXTVAL , 'HaEr');
INSERT INTO dzialy
(department_id , department_name)
VALUES (numeracja.NEXTVAL , 'Kadry');
INSERT INTO dzialy
(department_id , department_name)
VALUES (numeracja.NEXTVAL , 'Projekty');
select * from dzialy;

INSERT INTO dzialy
(department_id , department_name)
VALUES ('' , 'Projekty 1');
INSERT INTO dzialy
(department_id , department_name)
VALUES ('' , 'Projekty 2');
INSERT INTO dzialy
(department_id , department_name)
VALUES ('' , 'Projekty 3');
UPDATE dzialy
SET
department_id=numeracja.NEXTVAL
where department_id is null;
DROP SEQUENCE
runner_id_seq;
DROP SEQUENCE
numeracja;
drop table dzialy;
-------
create table Dzialy as (select * from departments);
SAVEPOINT one;
INSERT INTO dzialy
(department_id , department_name)
VALUES (300 , 'Nowy dzial ONE');
SAVEPOINT two;
INSERT INTO dzialy
(department_id , department_name)
VALUES (301 , 'Nowy dzial TWO');
INSERT INTO dzialy
(department_id , department_name)
VALUES (302 , 'Nowy dzial THREE');
select * from dzialy;
ROLLBACK TO SAVEPOINT one;
ROLLBACK TO SAVEPOINT two;
COMMIT;
ROLLBACK;
create table Dzialy2 as (select * from departments); powoduje autocommit
Utwórz Dzialy 3, sekwencje For3 1000 + 100, przenumeruj dzialy w Dzialy3.
Pokaz zawartosc Dzialy3.
create table Dzialy3 as (select * from departments);
create sequence For3 increment by 100 start with 1000 nomaxvalue nocycle nocache;
update dzialy3 set department_id=for3.nextval;
select * from dzialy3;
rollback;
alter sequence For3 increment by 1000;
update dzialy3 set department_id=for3.nextval;

rollback;
drop sequence For3;
create sequence For3 increment by 100 start with 500 nomaxvalue nocycle nocache;
update dzialy3 set department_id=for3.nextval;

select * from dzialy3;

select For3.currval from dual;
select For3.nextval from dual;

 
L11
GRANT
SELECT, INSERT
ON
clients
TO
scott_king
WITH
GRANT OPTION;

Daniel -> sql053
select * from sql100.employees;
select * from USER_TAB_PRIVS_MADE;
select * from USER_TAB_PRIVS_RECD;
select * from all_TAB_PRIVS_RECD;

GRANT
SELECT
ON
employees
TO
sql053;
GRANT
SELECT
ON
employees
TO
PUBLIC;

WITH
GRANT OPTION;
create table student
(
id NUMBER(3),
imie VARCHAR2(30),
nazw VARCHAR2(30));
insert into student
(imie, nazw)
values
('Andrzej','Zurawski');
select * from student;
---- kontekst sql100

select * from sql100.student;
GRANT SELECT
ON
student
TO
PUBLIC;
insert into sql100.student
(imie, nazw)
values
('Daniel','ccc');

GRANT insert
ON
student
TO
PUBLIC;

GRANT select, insert, update
ON
student
TO
PUBLIC;
alter table student
add (wyn_po_studiach number(6));
update sql100.student
set wyn_po_studiach = 100
where nazw='Zurawski';
commit;
create sequence stu_id;
update sql100.student
set id=stu_id.nextval
where id is null;
commit;

GRANT delete
ON
student
TO
PUBLIC;
REVOKE delete ON student FROM PUBLIC;
REVOKE ALL ON student FROM PUBLIC;
REVOKE ALL ON employees FROM sql053;
REVOKE ALL ON employees FROM PUBLIC;
select * from USER_TAB_PRIVS_MADE;

 
L12

Przygotuj tabelę ProponowanePodwyzki.
Struktura: ID, nazwa departamentu, stazowa, podleglosc, wyrownanie
Napelnij tabelę danymi:
0. id oraz nazwe departamentu z tabel employees i departments
1. podwyzka stazowa to 13 za kazdy pelny przepracowany miesiac
2. podwyzka za podleglosc to 222 dla pracownikow, ktorzy nie sa przelozonymi
3. wyrownanie do średniej to dla pracownikow zarabiajacym mniej niz srednia w departamencie 
kwota ktora stowi roznice pomiedzuy srednia, a wynagrodzenniem tego pracownika
Pokaz raport przedstawiajacy: imie, nazwisko, laczna podwyzke i % wartosc podwyzki w relacji do wynagrodzenia dla wszystkich pracownikow.
-- Przygotuj tabelę ProponowanePodwyzki.
-- Struktura: ID, nazwa departamentu, stazowa, podleglosc, wyrownanie
create table ProponowanePodwyzki
(ID number(3),
NazwaDepartamentu varchar2(30),
stazowa number(8,2),
podlegosc number(8,2),
wyrownanie number(8,2)
);
-- 0. id oraz nazwe departamentu z tabel employees i departments
insert into proponowanepodwyzki
(id, NazwaDepartamentu)
select employee_id, department_name
from employees left join departments using (department_id);
commit;
select * from proponowanepodwyzki;
-- 1. podwyzka stazowa to 13 za kazdy pelny przepracowany miesiac
select employee_id, 13*trunc(months_between(sysdate, hire_date),0)
from employees;
update proponowanepodwyzki
set
stazowa=(select 13*trunc(months_between(sysdate, hire_date),0) from employees where employee_id=id);
-- 2. podwyzka za podleglosc to 222 dla pracownikow, ktorzy nie sa przelozonymi
select distinct manager_id from employees where manager_id is not null; 
select employee_id from employees where employee_id not in (select distinct manager_id from employees where manager_id is not null);
update proponowanepodwyzki
set 
podlegosc=222
where id not in (select distinct manager_id from employees where manager_id is not null);
-- 3. wyrownanie do średniej to dla pracownikow zarabiajacym mniej niz srednia w departamencie 
-- kwota ktora stowi roznice pomiedzuy srednia, a wynagrodzenniem tego pracownika
select employee_id, round((select avg(salary) from employees e2 where e2.department_id=e1.department_id)-salary,2) "srWdept"
from employees e1 where (select avg(salary) from employees e2 where e2.department_id=e1.department_id)-salary>0;
update proponowanepodwyzki
set 
wyrownanie=(select round((select avg(salary) from employees e2 where e2.department_id=e1.department_id)-salary,2) from employees e1 where e1.employee_id=id)
where 
id in (select employee_id from employees e1 where ((select avg(salary) from employees e2 where e2.department_id=e1.department_id)-salary)>0);
commit;
-- Pokaz raport przedstawiajacy: imie, nazwisko, laczna podwyzke i % wartosc podwyzki w relacji do wynagrodzenia dla wszystkich pracownikow.
select first_name, last_name, 
nvl(stazowa,0)+nvl(podlegosc,0)+nvl(wyrownanie,0) "Proponowana podwyżka", 
round(100*(nvl(stazowa,0)+nvl(podlegosc,0)+nvl(wyrownanie,0))/salary,2) "% Proponowana podwyżka"
from employees join proponowanepodwyzki on employees.employee_id=proponowanepodwyzki.id;

 
L13

1. Pokaż raport zawierający listę zdefiniowanych regionów, liczbę pracowników w każdym z nich oraz strukturę % zatrudnienia wg regionów. 
Dla pracowników nie przydzielonych do regionu oznacz go INNY.

select nvl(region_name,'INNY'), count(employee_id), round(100*count(employee_id)/(select count(employee_id) from employees),2) 
from employees 
left join departments using (department_id)
left join locations using (location_id)
left join countries using (country_id)
full join regions using (region_id)
group by nvl(region_name,'INNY');

2. Pokaż listę wszystkich pracowników (imię i nazwisko), wynagrodzenie roczne wraz z bonusem, nazwę departamentu i % odchylenie od średniej w departamencie. 
Posortuj wg nazw departamentów rosnąco i % odchyleń malejąco.

-- desc employees;
select first_name, last_name, 12*nvl(salary,0)+nvl(bonus,0) "TOTAL WYN", department_name, 
round(((12*nvl(salary,0)+nvl(bonus,0))-
(select avg(12*nvl(salary,0)+nvl(bonus,0)) from employees e2 where e1.department_id=e2.department_id))/
(select avg(12*nvl(salary,0)+nvl(bonus,0)) from employees e2 where e1.department_id=e2.department_id)*100 ,2) "Odchylenie"
from employees e1 left join departments d1 on e1.department_id = d1.department_id
order by 4, 5 desc;

-- select avg(12*nvl(salary,0)+nvl(bonus,0)) from employees e2 where e1.department_id=e2.department_id
3. Pokaż listę nazw departamentów, najniższe i najwyższe wynagrodzenie w każdym z nich.
select department_name, min(salary), max(salary)
from employees join departments using(department_id)
group by department_name;
4. Pokaż listę miast i nazw departamentów, liczbę pracowników. Pokaż również podsumowania dla miast.
select city, department_name, count(employee_id)
from employees 
join departments using (department_id)
right join locations using (location_id)
group by city, rollup(department_name);
5. Pokaż listę kryptonimów dla wszystkich pracowników postaci: EXEC_smith_VP_24. 
Gdzie człony to odpowiednio nazwa departamentu, nazwisko, stanowisko, pensja bez 000.

select upper(nvl(department_name,'NODEPT'))||'_'||lower(last_name)||'_'||job_id||'_'||trunc(salary/1000)
from employees left join departments using (department_id);

6. Oblicz liczbę menadżerów w firmie.
select count(distinct manager_id) from employees where manager_id is not null;
7. Pokaż raport zawierający nazwiska oraz daty, kiedy poszczególne osoby będą obchodzić 50-lecie pracy w firmie. Posortuj od najbliższej daty obchodów.
select last_name, hire_date, add_months(hire_date,600) from employees;

