type
  Node = ^NewNode;
  NewNode = record
    info: integer;
    next: Node;
  end;
//создание типа Узел
var
  NHead: Node;n, x: integer;//объявление головы стека, количества элементов и элементов

function CreatNode(x: integer): Node;//создание узла
var
  TNode: Node;
begin
  new(TNode);
  TNode^.info := x;
  TNode^.next := nil;
  result := TNode;
end;

procedure Push(TNode: Node);//добавление элемента в стек
begin
  TNode^.next := NHead;
  Nhead := TNode;
end;

procedure CreatorDeleteStack ();//создание пустого стека или очищение 
begin
  NHead := nil;
end;

function ifStackEmpty(): boolean;//проверка стека на пустоту
begin
  result := (NHead = nil);
end;

function Pop(): integer;//взятие последнего элемента стека (удаление, но элемент созраняется, для возможного использования)
begin
  if ifStackEmpty then writeln('Стек пуст')
  else 
  begin
    Pop := NHead^.info;
    NHead := NHead^.next;
  end;
end;

procedure WriteStack();//вывод стека
var
  q: Node;
begin
  q := NHead;
  if q=nil then writeln('Пустой стек') else
  while q <> nil do
  begin
    write(q^.info, ' ');
    q := q^.next;
  end;
  writeln();
end;

begin
write('Введите количество элементов стека:');
  readln(n);
  CreatorDeleteStack;
  writeln('Введите элементы стека:');
  for i: integer := 1 to n do
  begin
    read(x);
    Push(CreatNode(x));
  end;
  writeln('Проверим пуст ли стек?');
  writeln(ifStackEmpty);
  WriteStack;
  writeln('Возьмем дважды последний элемент (т.е. предпоследний)');
  Pop;
  x := Pop;
  WriteStack;
  writeln('Значение последнего взятого элемента:',x);
  writeln('Очистим стек');
  CreatorDeleteStack;
  WriteStack;
end.