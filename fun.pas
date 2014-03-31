const h:array[1..4]of char=('+','-','*','/');
var f:array[0..5,0..5,0..5]of longint;
    a:array[0..4]of longint;
    done:array[0..4]of boolean;
    i,j,p,k:longint;
    ans:ansistring;
procedure dfs(n,now:longint;st:ansistring);
var i:longint;
begin
  if(n=4)then
    begin
      if now=24 then
        begin
          if st<ans then ans:=st;
        end;
      exit;
    end;
  for i:=1 to 4 do
   if done[i]=false then
     begin
       done[i]:=true;
       dfs(n+1,now+a[i],'('+st+'+'+chr(a[i]+48)+')');
       dfs(n+1,now-a[i],'('+st+'-'+chr(a[i]+48)+')');
       dfs(n+1,now*a[i],'('+st+'*'+chr(a[i]+48)+')');
       if now mod a[i]=0 then
       dfs(n+1,now div  a[i],'('+st+'/'+chr(a[i]+48)+')');
       done[i]:=false;
     end;
end;
procedure work(i,j,ii,jj:longint);
var st:ansistring;
    iii,jjj,ppp:longint;
    aa:array[0..5]of longint;
begin
 for iii:=1 to 4 do
   begin
     if(iii=4)and(a[i]mod a[j]<>0)then continue;
     for jjj:=1 to 4 do
     begin
       if(jjj=4)and(a[ii]mod a[jj]<>0)then continue;
       aa[1]:=f[i,j,iii]+f[ii,jj,jjj];
       aa[2]:=f[i,j,iii]-f[ii,jj,jjj];
       aa[3]:=f[i,j,iii]*f[ii,jj,jjj];
       if f[ii,jj,jjj]<>0 then
       aa[4]:=f[i,j,iii]div f[ii,jj,jjj];
       for ppp:=1 to 4 do
         begin
           if(ppp=4)and(f[ii,jj,jjj]=0)then continue;
           if(ppp=4)and(f[i,j,iii]mod f[ii,jj,jjj]<>0)then continue;
           if aa[ppp]=24 then
             begin
               st:='(('+chr(a[i]+48)+h[iii]+chr(a[j]+48)+')'+h[ppp]+'('+char(a[ii]+48)+h[jjj]+chr(a[jj]+48)+'))';
              if st<ans then ans:=st;
             end;
         end;
     end;
   end;
end;
begin
  assign(input,'fun.in');reset(input);
  assign(output,'fun.out');rewrite(output);
  for i:=1 to 4 do read(a[i]);
  ans:='zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz';
  for i:=1 to 4 do
  for j:=1 to 4 do
  if(i<>j)then
  begin
    done[i]:=true;done[j]:=true;
    f[i,j,1]:=a[i]+a[j];
    dfs(2,a[i]+a[j],'('+chr(a[i]+48)+'+'+chr(a[j]+48)+')');
    f[i,j,2]:=a[i]-a[j];
    dfs(2,a[i]-a[j],'('+chr(a[i]+48)+'-'+chr(a[j]+48)+')');
    f[i,j,3]:=a[i]*a[j];
    dfs(2,a[i]*a[j],'('+chr(a[i]+48)+'*'+chr(a[j]+48)+')');
    f[i,j,4]:=a[i]div a[j];
    if a[i]mod a[j]=0 then
    dfs(2,a[i]div a[j],'('+chr(a[i]+48)+'/'+chr(a[j]+48)+')');
    done[i]:=false;done[j]:=false;
  end;
 for i:=1 to 4 do
 for j:=1 to 4 do
 if i<>j then
 for p:=1 to 4 do
 if(p<>i)and(p<>j)then
   work(i,j,p,10-i-j-p);
writeln(ans);
close(input);close(output);
end.