program tema16task5;
type Tint = file of integer;
var fpint,new_int:Tint;
i,n:integer;
choose:byte;
name_of_file,new_file:string[20];

procedure create_file;
begin
Write('Введите название файла: ');
ReadLn(name_of_file);
assign(fpint, name_of_file);
Rewrite(fpint);
for i:=1 to 100 do begin
n:=random(101)-100;
Write(fpint, n);
end;
Close(fpint);
WriteLn('Файл успешно создан.');
WriteLn;
end;

procedure read_file;
begin
Write('Введите название файла: ');
ReadLn(name_of_file);
assign(fpint, name_of_file);
Reset(fpint);
While not EOF (fpint) do
begin
Read(fpint, n);
Write(n:4);
end;
WriteLn;
WriteLn;
Close (fpint);
end;

procedure copy_file;
begin
Write('Введите название копируемого файла: ');
ReadLn(name_of_file);
assign(fpint, name_of_file);
Reset(fpint);
Write('Введите название результирующего файла: ');
ReadLn(new_file);
assign(new_int, new_file);
Rewrite(new_int);
While not EOF (fpint) do begin
Read(fpint,n);
Write(new_int,n);
end;
WriteLn;
Close(fpint);
Close(new_int);
end;

BEGIN
randomize;
repeat
WriteLn('1. Создать файл');
WriteLn('2. Прочитать файл');
WriteLn('3. Скопировать файл');
WriteLn('4. Завершить работу');
Write('Ваш выбор: ');
ReadLn(choose);
WriteLn;
case choose of
1: create_file;
2: read_file;
3: copy_file;
end;
until choose=4;
END.
