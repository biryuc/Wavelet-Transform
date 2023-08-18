-- Table: public.patients

DROP TABLE IF EXISTS public.patients CASCADE;

CREATE TABLE IF NOT EXISTS public.patients
(
    "ID" serial NOT NULL PRIMARY KEY ,
    "Пол" character(10) NOT NULL,
    "Год_рождения" integer NOT NULL 
--     CONSTRAINT patients_pkey PRIMARY KEY ("ID")
);



DROP TABLE IF EXISTS public.orders;

CREATE TABLE IF NOT EXISTS public.orders
(
    "ID" serial NOT NULL PRIMARY KEY ,
    "ID_Пациента" bigint NOT NULL references public.patients("ID"),
    "Дата" varchar(20) ,
	"Причина" varchar(50) ,
	"Врач" varchar(50) ,
	"Место" varchar(50)
);

DROP TABLE IF EXISTS public.disease_covid19;

CREATE TABLE IF NOT EXISTS public.disease_covid19
(
    "ID" serial NOT NULL PRIMARY KEY ,
    "ID_Пациента" bigint NOT NULL references public.patients("ID"),
    "Дата" varchar(20) ,
	"Подтверждение" varchar(10),
	"Поражение_на_КТ" varchar(20)
);

DROP TABLE IF EXISTS public.vaccine_covid19;

CREATE TABLE IF NOT EXISTS public.vaccine_covid19
(
    "ID" serial NOT NULL PRIMARY KEY ,
    "ID_Пациента" bigint NOT NULL references public.patients("ID"),
    "Дата" varchar(20) ,
	"Вакцина" varchar(50) 
);

DROP TABLE IF EXISTS public.pulmonary_auscultation;

CREATE TABLE IF NOT EXISTS public.pulmonary_auscultation
(
    "ID" serial NOT NULL PRIMARY KEY ,
    "ID_Пациента" bigint NOT NULL references public.patients("ID"),
	"Точка1" varchar(50) NOT NULL,
	"Точка2" varchar(50) NOT NULL,
	"Точка3" varchar(50) NOT NULL,
	"Точка4" varchar(50) NOT NULL,
	"Точка5" varchar(50) NOT NULL,
	"Точка6" varchar(50) NOT NULL,
	"Комментарии" varchar(200) NOT NULL
);


DROP TABLE IF EXISTS public.anamnesis;

CREATE TABLE IF NOT EXISTS public.anamnesis
(
    "ID" serial NOT NULL PRIMARY KEY ,
    "ID_Пациента" bigint NOT NULL references public.patients("ID"),
	"Сопутствующие_заболевания" varchar(50) NOT NULL,
	"Курит" varchar(10) ,
	"Вес_кг" integer ,
	"Рост_м" real,
	"Окружность_талии_м"  real,
	"Сатурация" integer,
	"Пульс" integer,
	"Систолическое_давление" integer,
	"Диастолическое_давление" integer,
	"Комментарии" varchar(200) 

)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.patients
    OWNER to postgres;
	
	
-- INSERT INTO disease_covid19 values('1','2022-07-16','ПЦР','15')
	
	
