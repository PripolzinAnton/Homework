type
  Node = ^NewNode;
  NewNode = record
    info: integer;
    next: Node;
  end;
//создание типа Узел
var
  NHead, NTail: Node;n, x: integer;//объявление головы очереди, количества элементов и элементов

function CreatNode(x: integer): Node;//создание узла
var
  TNode: Node;
begin
  new(TNode);
  TNode^.info := x;
  TNode^.next := nil;
  result := TNode;
end;

procedure Push(TNode: Node);//добавление элемента в очередь
begin
  if NHead = nil then
  begin
    TNode^.next := NHead;
    Nhead := TNode; 
    NTail := TNode
  end
  else if Nhead^.next = nil then 
  begin
    NHead^.next := TNode;
    NTail:=TNode;
  end
  else 
  begin
    NTail^.next := TNode;
    NTail := TNode;
  end;
end;

procedure CreatorDeleteQueue ();//создание пустой очереди или очищение 
begin
  NHead := nil;
  NTail := nil;
end;

function ifStackEmpty(): boolean;//проверка очереди на пустоту
begin
  result := (NHead = nil);
end;

function Pop(): integer;//взятие первого элемента очереди (удаление, но элемент сохраняется, для возможного использования)
begin
  if ifStackEmpty then writeln('ОЧередь пуста')
  else 
  begin
    Pop := NHead^.info;
    NHead := NHead^.next;
  end;
end;

procedure WriteQueue();//вывод стека
var
  q: Node;
begin
  q := NHead;
  if q = nil then writeln('Пустая очередь') else
    while q <> nil do
    begin
      write(q^.info, ' ');
      q := q^.next;
    end;
  writeln();
end;

begin
  write('Введите количество элементов очереди:');
  readln(n);
  CreatorDeleteQueue;
  write('Введите элементы очереди:');
  for i: integer := 1 to n do
  begin
    read(x);
    Push(CreatNode(x));
  end;
  writeln('Проверим пуста ли очередь?');
  writeln(ifStackEmpty);
  WriteQueue;
  writeln('Возьмем дважды первый элемент (т.е. сохраним второй)');
  Pop;
  x := Pop;
  WriteQueue;
  writeln('Значение последнего взятого элемента:', x);
  writeln('Очистим очередь');
  CreatorDeleteQueue;
  WriteQueue;
end.