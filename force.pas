program dfx;
const o=1100;
var
	i,j,k,l,n,m,ans:longint;
	a:array[0..o]of longint;
	f:array[0..o,0..o]of longint;

function min(x,y:longint):longint;
begin
	if x>y then min:=y      else min:=x;
end;

begin
	assign(input,'force.in');	reset(input);
	assign(output,'force.out');	rewrite(output);
		read(n);
		for i:=1 to n	do
			read(a[i]);
                fillchar(f,sizeof(f),$78);
		f[0,0]:=0;
		for i:=1 to n do
		for j:=0 to i-1 do
		begin
                        if i=1 then l:=0        else  l:=abs(a[i]-a[i-1]);
                        f[i,j]:=f[i-1,j]+l;
                        if j=i-1 then
                        for k:=0 to j-1 do
                        begin
                                if k=0 then l:=0        else l:=abs(a[i]-a[k]);
                                f[i,j]:=min(f[i,j],f[j,k]+l);
                        end;
		end;
		ans:=f[n,0];
                //write(ans);
		for i:=1 to n-1 do
                        ans:=min(f[n,i]+abs(a[n]-a[i]),ans);
                {for i:=1 to n do
                begin
                        for j:=1 to i-1 do
                        write(f[i,j]:15);
                        writeln;
                end;   }
		write(ans);
	close(input);		close(output);
end.
