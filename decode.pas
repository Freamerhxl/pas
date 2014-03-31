program dfx;
var
	i,j,k,l,n,m,ans,head,f:longint;
	a:array[0..100000]of integer;
	b:array[0..200]of integer;
        c:char;
procedure change(o:longint);
var i,j:longint;
begin
	for 	j:=0 to m-1 do
	begin
                i:=(f+n-j)mod n;
		a[i]:=a[i] xor b[m-j-1];
	end;
        if o<k then f:=(f+l)mod n;
end;

begin
	assign(input,'decode.in');	reset(input);
	assign(output,'decode.out');	rewrite(output);
		readln(n,m,l,k);
		for i:=0 to m-1 do
                begin
                        read(c);
			b[i]:=ord(c)-48;
                end;
                readln;
		for i:=0 to n-1 do
                begin
                        read(c);
			a[i]:=ord(c)-48;
                end;


                head:=(n-m+l)mod n;
                f:=(n-1+l)mod n;;
		for i:=1 to k do
			change(i);

                head:=(f+1)mod n;
		for i:=0 to n-1 do
                begin
                       write(a[head]);
                       head:=(head+1)mod n;
                end;
                close(input);   close(output);
end.
