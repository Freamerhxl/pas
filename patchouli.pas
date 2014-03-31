var mo,a:array[0..3001]of longint;
    n,sum,m,temp,i,j:longint;
    ch:char;
begin
   assign(input,'patchouli.in');reset(input);
   assign(output,'patchouli.out');rewrite(output);
   while not eoln do
     begin
       read(ch);
       if ch in['A'..'Z']=false then break;
       inc(n);
       a[n]:=ord(ch)-65;
     end;
   read(m);
   mo[n]:=1;
   for i:=n-1 downto 1 do
     mo[i]:=(mo[i+1]*26)mod m;
   for i:=1 to n do
     sum:=sum+mo[i]*a[i];
   if sum mod m=0 then
     begin
       writeln(0,' ',0);
       close(output);halt;
     end;
   for i:=1 to n-1 do
   for j:=i+1 to n do
     begin
       temp:=sum-a[i]*mo[i]+a[i]*mo[j]-a[j]*mo[j]+a[j]*mo[i];
       if temp mod m=0 then
         begin
           writeln(i,' ',j);
           close(output);
           halt;
         end;
     end;
   writeln('-1 -1');
   close(input);close(output);
end.