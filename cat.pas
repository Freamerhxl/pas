program dfx;
const maxl=10000000;
type
        long=array[0..900]of longint;
var
	i,j,k,l,a,b,c,n,m,ans:longint;
        f:array[0..4]of long;
        x1,x2,x3:long;


function add(a,b:long):long;
var i,j,k,len:longint;
begin
        if a[0]>b[0] then
                len:=a[0]
        else
                len:=b[0];
        add[len+1]:=0;
        for i:=1 to len do
                add[i]:=a[i]+b[i];
        for i:=1 to len do
        begin
                add[i+1]:=add[i+1]+add[i] div maxl;
                add[i]:=add[i] mod maxl;
        end;
        if add[len+1]>0 then
                add[0]:=len+1
        else
                add[0]:=len;
end;

function cheng(a:long;x:longint):long;
var i,j,len:longint;
begin
        len:=a[0];      fillchar(cheng,sizeof(cheng),0);
	for i:=1 to len do
		cheng[i]:=a[i]*x;
	for i:=1 to len do
	begin
		cheng[i+1]:=cheng[i+1]+cheng[i] div maxl;
                cheng[i]:=cheng[i] mod maxl;
	end;
	while cheng[len+1]>0 do
	begin
		len:=len+1;
		cheng[len+1]:=cheng[len+1] +cheng[len] div maxl;
		cheng[len]:=cheng[len] mod maxl;
	end;
        cheng[0]:=len;
end;

begin
	assign(input,'cat.in');	        reset(input);
	assign(output,'cat.out');	rewrite(output);
                readln(a,b,c,n);
                f[3,0]:=1;      f[3,1]:=1;
                f[2,0]:=1;      f[1,0]:=1;
                for i:=1 to n do
                begin
                   {f[4]:=a*f[3]+b*f[2]+c*f[1];
                   f[1]:=f[1]+f[2];f[2]:=f[3];f[3]:=f[4];
                   if i=n then
                   write(f[1]+f[2]+f[3]);}
                   x1:=cheng(f[3],a);
                   x2:=cheng(f[2],b);
                   x3:=cheng(f[1],c);
                   f[4]:=add(x1,x2);
                   f[4]:=add(f[4],x3);
                   f[1]:=add(f[1],f[2]);
                   f[2]:=f[3];
                   f[3]:=f[4];
                end;
		f[4]:=add(f[1],f[2]);
                f[4]:=add(f[4],f[3]);
                m:=f[4,0];
                write(f[4,m]);
		for i:=m-1 downto 1 do
                begin
                        j:=trunc(ln(f[4,i])/ln(10))+1;
                        for k:=1 to 7-j do
                        write(0);
		        write(f[4,i]);
                end;
	close(input);		close(output);
end.