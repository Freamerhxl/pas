program dfx;
const nn=1000000;
var
	i,j,k,l,n:longint;
	a:array[0..nn]of longint;
	ans,m,sum:int64;
procedure main;
begin
        ans:=-maxlongint;
        ans:=ans-4;             //*******!!

        m:=0;	sum:=0;
        for i:=1 to n do
        begin
		sum:=sum+a[i];
                m:=m+a[i];
		if ans<m then ans:=m;
		if m<0 then m:=0;
        end;

        m:=0;    l:=0;    k:=-maxlongint-1;
	for i:=1 to n do
 	begin
                if a[i]>k then k:=a[i];
		m:=m+a[i];
		if (ans<sum-m) then ans:=sum-m;
		if m>0 then
                begin
                        m:=0;   l:=1;
                end;
	end;
        if l=0 then ans:=k;
end;

begin
                readln(n);
                for i:=1 to n do
                        read(a[i]);
                main;
                write(ans);
end.
