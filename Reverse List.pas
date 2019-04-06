type
  node = ^newnode;
  newnode = record
    info: integer;
    next: node;
  end;

var
  head: node; count: integer;

function CreatNode(x: integer): node;
var
  Tnode: node;
begin
  new(Tnode);
  Tnode^.info := x;
  Tnode^.next := nil;
  result := Tnode;
end;

procedure addHead(Tnode: node);
begin
  Tnode^.next := head;
  head := Tnode;
end;

procedure addAfter(var CuNode: node; Tnode: node);
begin
  Tnode^.next := CuNode^.next; 
  CuNode^.next := Tnode;
end;

procedure addTail(Tnode: node);
var
  q: node;
begin
  if head = nil then addHead(Tnode)
  else
  begin
    q := head;
    while q^.next <> nil do
      q := q^.next;
    addAfter(q, Tnode);
  end;
end;

procedure CreatList();
var
  x: integer;
begin
  head := nil;
  write('Enter elements: ');
  for i: integer := 1 to count do
  begin
    read(x);
    addTail(CreatNode(x));
  end;
end;

procedure ReverseList(); //алгоритм заключается в развороте ссылок в обратную сторону
//пусть дан список 1->2->3->4->5->nil, на его примере объясню работу алгоритма
var
  TempNode: node; //временный узел - узел ссылку которого необходимо обратить
  TempHead: node; //временная голова - узел у которого на данный момент нет предка, но он не является головой
begin
  if (head <> nil) then //проверка на пустоту
  begin
    TempNode := head^.next; //объявление, теперь TempNode это 2 (для краткости TN)
    TempHead := head^.next; //объявление, теперь TempHead это 2 (для краткости TH)
    head^.next := nil; //устанавливаем обратную ссылку, теперь список имеет вид nil<-1(head) 2(TN,TH)->3->4->5->nil
    while TempHead <> nil do 
    begin
      TempHead := TempNode^.next; // ТН это 3; nil<-1(head) 2(TN)->3(ТН)->4->5->nil
      TempNode^.next := head; // устанавливаем обратную ссылку; nil<-1(head)<-2(TN) 3(ТН)->4->5->nil
      head := TempNode; // переопределяем голову; nil<-1<-2(TN,head) 3(ТН)->4->5->nil
      TempNode := TempHead; // TN это 3; nil<-1<-2(head) 3(ТН,TN)->4->5->nil
    end;
    //в итоге получим nil<-1<-2<-3<-4<-5(head); nil(TN,TH); так что в условии цикла можно написать и TN <> nil, вместо ТН 
  end;
end;

procedure WriteList ();
var
  q: node;
begin
  q := head;
  write('List: ');
  while q <> nil do
  begin
    write(q^.info, ' ');
    q := q^.next;
  end;
  writeln();
end;

begin
  write('Enter the count of list elements: ');
  read(count);
  CreatList();
  WriteList();
  ReverseList();
  writeln('After Reverse');
  Writelist();
end.
