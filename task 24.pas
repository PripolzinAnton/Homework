type
  list = ^newlist;//объявляем тип односвязный список
  newlist = record
    info: integer;
    next: list;
  end;

var
  lhead, flag: list; n, R: integer;
//объявляем "голову" списка и переменные n - количество элементов списка и x-узел списка, в данном случае целое число
//т.к. "голова" списка глобальная переменная не имеет смысла подавать её в функции и процедуры
function CreatNode(x: integer): list;// функция создающая новый узел в списке
var
  Tlist: list;
begin
  new(Tlist);//выделение памяти под новую переменную типа список
  Tlist^.info := x;//присваивание узлу значения
  Tlist^.next := nil;//установка ссылки на следующий узел
  result := Tlist;//возвращение списка с новым узлом в программу
end;

procedure addHead(Tlist: list);//добавление нового узла в начало списка
begin
  Tlist^.next := lhead;// ссылка новго узла устанавливается на "голову списка"
  lhead := Tlist;// новый узел обозначается как "голова" списка
end;

procedure addAfter(var CuNode: list; Tlist: list);//добавление нового узла списка после заданного
begin
  Tlist^.next := CuNode^.next; //установить ссылку нового узла на узел следующий за заданным
  CuNode^.next := Tlist; //установить ссылку заданного узла на новый узел
end;

procedure addTail(Tlist: list);//добавление в "хвост"
var
  q: list;
begin
  if lhead = nil then addHead(Tlist)//если список пустой, необходимо добавить в него первый узел
  else
  begin
    q := lhead;
    while q^.next <> nil do
      q := q^.next;//поиск последнего ненулевого узла списка
    addAfter(q, Tlist);//добавление нового узла в "хвост"
  end;
end;

procedure WriteList ();//вывод списка
var
  q: list;
begin
  q := lhead;
  while q <> nil do
  begin
    write(q^.info, ' ');
    q := q^.next;
  end;
end;

procedure delete(var Node: list);
var
  q: list;
begin
  if Node = nil then writeln('элемент отсутствует')
  else if Node = lhead then lhead := Node^.next
  else
  begin
    q := lhead;
    while (q^.next <> Node) and (q^.next <> nil) do
      q := q^.next;
    q^.next := Node^.next;
  end;
end;

function find(number: integer): list;
var
  temp: list;
begin
  temp := lhead;
  for i: integer := 1 to number - 1 do
    temp := temp^.next;
  result := temp;
end;

procedure Algoritm(n: integer; R: integer);
var
  flagInt: integer;temp: list;
begin
  flagInt := 1;
  while n <> 1 do
  begin
    if n > R - 1 then 
    begin
      if (flagInt + R - 1) mod n = 0 then flagInt := n //здесь если последний элемент в списке, то не нужно делать остаток от деления
      else
        flagInt := (flagInt + R - 1) mod n; //ищем какой новый будем удалять
    end;
    if n <= R - 1 then //в случае равенства между кол-вом элементов списка и шагом удаления (-1) или если меньше неправильно находить остаток от деления всего, нужно найти лишь новый шаг 
    begin
      flagInt := flagInt + (R - 1) mod n; 
      if flagInt > n then //если выход за пределы количества
        flagInt := flagInt - n; 
    end;
    writeln(flagint);
    temp := find(flagInt);
    delete(temp);
    WriteList();
    writeln();
    n := n - 1;
  end;
end;

begin
  readln(n);//считываем количество элементов круга
  for i: integer := 1 to n do
  //создаем список элементов расположенных по порядку и добавляем значения в конец
  begin
    addTail(CreatNode(i));
  end;
  write('Созданный круг: ');
  WriteList();
  writeln();
  write('Шаг удаления: ');
  readln(R);
  Algoritm(n, R);
  write('Останется: ');
  WriteList();//выводим список
end.












