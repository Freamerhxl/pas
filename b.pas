program dfx;
var
	i,j,k,l,n,m,ans:longint;
	a:array[0..]of longint;

procedure main;
begin
end;

begin
	assign(input,'b.in');	reset(input);
	assign(output,'b.out');	rewrite(output);
	close(input);		close(output);
end.








program dfx;
var
	i,j,k,l,n,m,ans,u,v:longint;
	a:array[0..5001,1..2]of longint;
        b,f:array[0..10000]of longint;
        ff:boolean;
procedure quick(u,v:longint);
var
        i,j,o:longint;
begin
        i:=u;   j:=v;   o:=a[(i+j)shr 1,1];
        while i<=j do
        begin
                while a[i,1]<o do i:=i+1;
                while a[j,1]>o do j:=j-1;
                if i<=j then
                begin
                        a[0]:=a[i];     a[i]:=a[j];     a[j]:=a[0];
                        i:=i+1; j:=j-1;
                end;
        end;
        if i<v then quick(i,v);
        if u<j then quick(u,j);
end;

procedure main;
begin
        quick(1,n);
        fillchar(f,sizeof(f),-1);
        f[0]:=0;
        for j:=1 to n do
        for i:=1 to m do
        begin
                k:=i-a[j,1];
                //if k<0 then break;
                if k>=0 then
                if (f[k]>=0)and(f[k]+a[j,2]>f[i]) then
                        f[i]:=f[k]+a[j,2];
        end;
end;

begin
	//assign(input,'b.in');	reset(input);
	//assign(output,'b.out');	rewrite(output);
		readln(n,m);
                if m=0 then
                begin
                        write(0);
                        close(input);
                        halt;
                end;
		for i:=1 to n do
	        for j:=1 to 2 do
                        read(a[i,j]);
                main;
                write(f[m]);
	//close(input);		close(output);
end.
