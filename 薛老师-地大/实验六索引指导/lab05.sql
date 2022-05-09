create table stu(
    num     int         not null unique,
    name    char(20)    not null,
    sex     int,
    age     int,
    dept    char(8));

create table cou(
    num     int         not null unique,
    name    char(20)    not null,
    credit  int);

create table s_c(
    s_num   int         not null,
    c_num   int         not null,
    grade   int);

create procedure insert_stu
as
declare	@sexflag int
declare	@age	int
declare @dept	char(8)
declare @i int
declare @j int
begin
        set @i = 1
        set @j = 9851
	while(@i<=9850)
          begin
		if(@i%4 = 0)
		     set @age = 17
		else
                   if(@i%4 = 1)
		     set @age = 18;
		else
                   if(@i%4 = 2)
			set @age = 19;
		else 
			set @age = 20;
	     
		if(@i%2 = 0)
			set @sexflag = 0;
		else
			set @sexflag = 1;
		

		if(@i%3 = 0)
			set @dept = 'CS';
		else
                  if(@i%3 = 1)
			set @dept = 'IS';
		else
			set @dept = 'MA';
		insert into stu values(@i, 'Name'+ convert(varchar(5),@i), @sexflag, @age, @dept);
	        set @i = @i + 1
            end	

	while(@j>=9851 and @j<=10000)
           begin
		if( @j%2 = 0)
                  begin 
			set @sexflag = 0;
			set @age = 21;
                  end
		else
                  begin
			set @sexflag = 1;
			set @age = 22;
		  end

		set @dept = 'CS';

		insert into stu values(@j, 'Name' +  convert(varchar(5),@j), @sexflag, @age, @dept);
	        set @j = @j + 1
          end
end;

create procedure insert_cou
as
declare @i int 
begin
        set @i = 1
	while(@i<=100)
        begin
		insert into cou values(@i, 'Name'+ convert(varchar(4),@i), @i%5);
                set @i = @i + 1
	end
end;


create procedure insert_s_c
as
declare @i int,@j int,@inum int
begin
        set @i = 1
        set @j = 1
        set @inum = 10000
	while(@j<=100)
            begin
             while(@i<=@inum)
                  begin
			insert into s_c values(@i,@j,(@i*@j)%100);
		        set @i = @i +1
                  end
             set @j = @j + 1
             set @i = 1
	    end
end;




