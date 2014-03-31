program dfx;
var
	i,j,k,l,n,m,ans1,ans2,aa,bb,t:longint;
	a:array[0..2]of longint;	{a[0]正式女友
					 a[1]1级潜在女友
					 a[2]2级潜在女友}
        b:array[0..5000000]of longint;

function gcd(n,m:longint):longint;
var o:longint;
begin
        o:=n mod m;
        while o>0 do
        begin
                n:=m;   m:=o;
                o:=n mod m;
        end;
        gcd:=m;
end;

procedure main;
begin
	a[0]:=0;	a[1]:=1;	a[2]:=0;
        b[1]:=(a[0]+a[1]+a[2])mod m;
        t:=-1;

	for i:=2 to bb do
	begin
                if i>5000000 then
                begin
                        writeln(0);
                        writeln(0);
                        write(0);
                        close(input);
                        halt;
                end;
		a[0]:=(a[2]+a[0])mod m;
		a[2]:=a[1];
		a[1]:=(a[0]*k)mod m;
                b[i]:=(a[0]+a[1]+a[2])mod m;
                if (b[i]=1)and(b[i-1]=1)and(i<>2) then
                begin
                        t:=i-2;
                        b[0]:=b[i];
                        break;
                end;
        end;
        if t>0 then
        begin
                ans1:=b[aa mod t];      ans2:=b[bb mod t];
                writeln(ans1);
                writeln(ans2);
                if ans2=0 then ans2:=m;
                writeln(gcd(ans1,ans2)mod m);
        end
        else
        begin
                ans1:=b[aa];    ans2:=b[bb];
                writeln(ans1);
                writeln(ans2);
                if ans2=0 then ans2:=m;
                writeln(gcd(ans1,ans2)mod m);
        end;
end;

begin
	assign(input,'copyist.in');	reset(input);
	assign(output,'copyist.out');	rewrite(output);
		read(k,m,aa,bb);
		main;
	close(input);		close(output);
end.
