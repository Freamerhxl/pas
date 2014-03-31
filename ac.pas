program AC;
const
   maxn = 1000000;
   maxm = 1000000;
var
   n,m,i,ans1,ans2 : longint;
   d               : array[1..maxn] of longint;
   spv,spnext      : array[1..maxm * 2] of longint;
   spn,x,y         : longint;
   link            : array[1..maxn] of longint;
   flag            : array[1..maxn] of 0..2 ;{0 : Unknown, 1 : Yes, 2 : No}
procedure outans(ans: longint);
begin
   if ans > 0 then
      writeln(ans)
   else
      writeln('NO');

   close(input);
   close(output);
   halt(0);
end; { outans }

procedure InsertEdge(x,y: longint);
begin
   inc(spn);
   spv[spn] := y;
   spnext[spn] := link[x];
   link[x] := spn;

   inc(spn);
   spv[spn] := x;
   spnext[spn] := link[y];
   link[y] := spn;
end; { InsertEdge }
procedure mark(x,f : longint);
var
   i,y : longint;
begin
   flag[x] := f;
   i:=link[x];
   while i <> 0 do begin
      y:=spv[i];
      if flag[y] = f then
         outans(-1);
      if flag[y] = 0 then begin
         if f = 1 then
            mark(y,2)
         else
            mark(y,1)
      end;
      i:=spnext[i];
   end;
end; { mark }

begin
   assign(input,'ac.in3');
   reset(input);
//   assign(output,'ac.out');
//   rewrite(output);
   spn:=0;
   fillchar(link,sizeof(link),0);

   readln(n,m);
   for i:=1 to n do
      read(d[i]);
   for i:=1 to m do begin
      readln(x,y);
      InsertEdge(x,y);
   end;
   { ------------------- Mark Yes ----------------------}
   fillchar(flag, sizeof(flag), 0);
   mark(1, 1);
   ans1:=0;
   for i:=1 to n do
      if flag[i] = 1 then
         inc(ans1, d[i]);
    { ------------------- Mark No ----------------------}
   fillchar(flag, sizeof(flag), 0);
   mark(1,2);
   ans2:=0;
   for i:=1 to n do
      if flag[i] = 1 then
         inc(ans2, d[i]);

   if ans1 < ans2 then
      outans(ans1)
   else
      outans(ans2);
end.