program dfx;
var
	i,o,j,k,l,n,m,ans,x1,x2,x3:longint;
	a:array[0..100,1..4]of longint;
	w:array[0..101,1..2]of longint;
procedure main;
begin
	for i:=1 to k do
	begin
        	x1:=a[0,4];	x2:=a[x1,4];
		w[1,1]:=abs(a[x1,2]-a[x2,2]);
                w[1,2]:=x1;
		x1:=a[n+1,3];	x2:=a[x1,3];
		w[n-(i-1),1]:=abs(a[x1,2]-a[x2,2]);
                w[n-(i-1),2]:=x1;
		x1:=a[0,4];
		for o:=2 to n-1-(i-1) do
		begin
			x2:=a[x1,4];	x3:=a[x2,4];
			w[o,1]:=abs(a[x2,2]-a[x1,2])+abs(a[x2,2]-a[x3,2])-abs(a[x3,2]-a[x1,2]);
			w[o,2]:=x2;
                        x1:=x2;
		end;

		j:=w[2,1];	l:=w[2,2];
		for o:=1 to n-(i-1) do
                if (w[o,1]>j) then
                if (w[o,2]<>a[0,4])and(w[o,2]<>a[n+1,3])or(n-i=2) then
		begin
			j:=w[o,1];
			l:=w[o,2];
		end;
		x1:=a[l,3];	x3:=a[l,4];
		a[x1,4]:=x3;	a[x3,3]:=x1;
	end;
	x1:=0;
	x2:=a[x1,4];	a[x1,2]:=a[x2,2];
	for i:=1 to n-k do
	begin
		ans:=ans+abs(a[x1,2]-a[x2,2]);
		x1:=x2;
		x2:=a[x1,4];
	end;
end;

begin
                readln(n,k);
		if n-k=1 then
		begin
			write(0);
			close(input);
			halt;
		end;
		fillchar(a,sizeof(a),0);
                for i:=1 to n do
                        read(a[i,1],a[i,2]);
                for i:=1 to n-1 do
                for j:=i+1 to n do
                if a[i,1]>a[j,1] then
                begin
                        a[0]:=a[i];     a[i]:=a[j];     a[j]:=a[0];
                end;

		a[0,4]:=1;	a[n+1,3]:=n;
                for i:=1 to n do
                begin
                        a[i,3]:=i-1;    a[i,4]:=i+1;
                end;
		main;
		write(ans);
end.