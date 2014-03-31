const x_x:set of char=['+','-','*','/','(',')','^'];
      p=99999999;
var n,i,j,m,kk:longint;
    a:array[1..9]of longint;
    st1:array[0..1000]of int64;
    st2:array[0..1000]of char;
    st3:array[0..1000]of string;
    st:string;
    can:boolean;
procedure go(st:string);
var i,j,k:longint;
    s:string;
begin
  m:=0;
  i:=pos(' ',st);
  while i>0 do
    begin
      delete(st,i,1);i:=pos(' ',st);
    end;
  s:='';
  for i:=1 to length(st) do
    if(st[i]in x_x)or(st[i]='a')then
     begin
       if s<>'' then
         begin
           inc(m);st3[m]:=s;
           s:='';
         end;
       inc(m);st3[m]:=st[i];
     end
    else
      s:=s+st[i];
    if s<>'' then
         begin
           inc(m);st3[m]:=s;
           s:='';
         end;
end;
function work(a:longint):int64;
var top1,top2,i,j:longint;
    temp:int64;
function isok(a,b:char):boolean;
begin
  if(a='^')and(b='^') then exit(true);
  if(a in['*','/'])and(b in['*','^','/'])then exit(true);
  if(a in['+','-'])and(b in['+','-','*','/','^'])then exit(true);
  exit(false);
end;
function doit(a:int64;ch:char;b:int64):int64;
var i:longint;
begin
  doit:=1;
  case ch of
    '+':exit((a+b)mod p);
    '-':exit((a-b)mod p);
    '*':exit((a*b)mod p);
    '/':exit((a div b)mod p);
    '^':for i:=1 to b do
          doit:=(doit*a)mod p;
  end;
end;
begin
  top1:=0;
  top2:=0;
  for i:=1 to m do
    if st3[i][1]in x_x then
      begin
        if(top2=0)then
        begin
        if st3[i][1]<>')' then
        begin
          inc(top2);
          st2[top2]:=st3[i][1]; end;
        end
        else
        if st3[i]='(' then
          begin
            inc(top2);
            st2[top2]:='(';
          end
        else
        if st3[i]=')' then
          begin
            while(st2[top2]<>'(')and(top2>0)do
              begin
                st1[top1-1]:=doit(st1[top1-1],st2[top2],st1[top1]);
                dec(top1);dec(top2);
              end;
            if st2[top2]='(' then
            dec(top2);
          end
        else
          begin
            while isok(st3[i][1],st2[top2])do
             begin
               st1[top1-1]:=doit(st1[top1-1],st2[top2],st1[top1]);
               dec(top1);dec(top2);
             end;
            inc(top2);
            st2[top2]:=st3[i][1];
          end;
      end
    else
      begin
        if st3[i]='a' then
          temp:=a
        else
           val(st3[i],temp,j);
         inc(top1);st1[top1]:=temp;
      end;
   while top2>0 do
             begin
               if st2[top2]<>'(' then begin
                st1[top1-1]:=doit(st1[top1-1],st2[top2],st1[top1]);
                dec(top1);end; dec(top2);
              end;
   exit(st1[top1]mod p);
end;
begin
  assign(input,'equal.in');reset(input);
  assign(output,'equal.out');rewrite(output);
  readln(st);
  go(st);
  for i:=2to 2 do
    a[i]:=work(i);
  readln(n);
  for i:=1 to n do
    begin
      readln(st);
      go(st);
      can:=true;
      for j:=2 to 2 do
        if work(j)<>a[j]then
          begin
            can:=false;
            break;
          end;
      if can then write(chr(65+i-1));
    end;
  close(input);close(output);
end.
