const p=100001;
      t=100000000;
      a:array[0..1,0..1]of real=((0.1,0.15),(0,0));
type point=^node;
     node=record
       x:longint;
       next:point;
end;
var hash:array[0..p]of int64;
    bel:array[0..p]of integer;
    son:array[0..p]of point;
    ti,ppp,z:array[0..p]of longint;
    i,j,n,m,k,l,r:longint;
    ans:extended;
    flag:boolean;
    data:int64;
    pp,p1:point;
function gethash(x:int64):longint;
var i:longint;
begin
  i:=x mod p;
  while(hash[i]<>x)and(hash[i]<>0)do
    begin
      i:=i+1;
      if i>=p then i:=0;
    end;
  hash[i]:=x;
  exit(i);
end;
begin
  assign(input,'sms.in');reset(input);
  assign(output,'sms.out');rewrite(output);
  readln(n,m);
  fillchar(hash,sizeof(hash),0);
  for i:=1 to n do
    begin
      read(data);
      k:=gethash(data);
      if (data div t)in[134..139]then
        bel[k]:=0
      else bel[k]:=1;
      read(data);
      while data<>0 do
        begin
          j:=gethash(data);
          if (data div t)in[134..139]then
            bel[j]:=0
          else bel[j]:=1;
          new(pp);pp^.x:=j;
          pp^.next:=son[k];son[k]:=pp;
          read(data);
        end;
    end;
  for i:=1 to m do
    begin
      read(data);
      fillchar(ti,sizeof(ti),43);
      z[0]:=gethash(data);
      ppp[0]:=p;
      ti[z[0]]:=0;   l:=0;r:=1;
      repeat
        pp:=son[z[l]];
        while pp<>nil do
          begin
            if ti[z[l]]<=ti[pp^.x]then
              begin
                ans:=ans+a[bel[z[l]],bel[pp^.x]];
                if ti[z[l]]+1<ti[pp^.x]then
                  begin
                    ti[pp^.x]:=ti[z[l]]+1;
                    z[r]:=pp^.x;inc(r);if r>p then r:=0;
                  end;
              end
            else
            begin
              p1:=son[pp^.x];flag:=true;
              while p1<>nil do
                begin
                  if p1^.x=z[l]then
                    begin
                      flag:=false;break;
                    end;
                  p1:=p1^.next;
                end;
              if flag then ans:=ans+a[bel[z[l]],bel[pp^.x]];
            end;
            pp:=pp^.next;
          end;
        inc(l);
        if l>p then l:=0;
      until l>=r;
    end;
  writeln(ans:0:2);
  close(input);close(output);
end.