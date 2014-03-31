var f,a,cost:array[0..101,0..1024]of longint;
      m:array[0..101]of longint;
    i,j,n,m,k:longint;
    st:string;
function work(opt1,opt2:longint):longint;
var i,j:longint;
begin

end;
begin
  assign(input,'color.in');reset(input);
  assign(output,'color.out');rewrite(output);
  readln(n);
  for i:=1 to n do
    begin
      readln(st);
    end;
  for i:=0to 1024 do
  for j:=0to 1024 do
    cost[i,j]:=work(i,j);
  close(input);close(output);
end.