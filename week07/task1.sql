-- а) За всеки студент се съхранява следната информация: 
-- фак. номер - от 0 до 99999, първичен ключ; 
-- име - до 100 символа; 
-- ЕГН - точно 10 символа, уникално; 
-- e-mail - до 100 символа, уникален; 
-- рождена дата; 
-- дата на приемане в университета - трябва да бъде поне 18 години след рождената; 
-- за всички атрибути задължително трябва да има зададена стойност (не може NULL)

-- б) добавете валидация за e-mail адреса - да бъде във формат <нещо>@<нещо>.<нещо>

-- в) създайте таблица за университетски курсове - уникален номер и име

-- всеки студент може да се запише в много курсове и във всеки курс 
-- може да има записани много студенти. 
-- При изтриване на даден курс автоматично да се отписват всички студенти от него.
create table student(
	FN int primary key check(FN >= 0 and fn <= 99999) not null,
	STUDENT_NAME varchar(100) not null,
	UCN varchar(10) unique not null,
	E_MAIL varchar(100) unique not null,
	BIRTHDAY date not null,
	UNI_BIRTHDAY date not null,
	
	 constraint uni check (UNI_BIRTHDAY >= DATEADD(YEAR, 18, BIRTHDAY)),
	 constraint email check (E_MAIL like '%@%.%')
)


create table course (
	COURSE_ID int identity(1, 1) primary key,
	COURSE_NAME varchar(100) 
)

create table studying(
	COURSE_ID int references course(COURSE_ID),
	STUDENT_FN int references student(FN)
)