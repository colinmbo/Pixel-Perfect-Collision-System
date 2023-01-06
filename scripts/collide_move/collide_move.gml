var m=argument0;
var d=argument1;
var c=argument2;
var n=argument3;

var ix=0,iy=0;
var nx=0,ny=0;
var h=false;
if m!=0&&!is_undefined(d) {
	ix=lengthdir_x(m,d);
	iy=lengthdir_y(m,d);
	var pd=point_direction(0,0,sign(ix),sign(iy));
	var pm=place_meeting(x+sign(ix),y+sign(iy),c);
	var nd=pd+180;
	for(var multiplier=-1;multiplier<=1;multiplier+=2) {
		var apd=pd+45*multiplier;
		if place_meeting(x+sign(lengthdir_x(1,apd)),y+sign(lengthdir_y(1,apd)),c) {
			if abs(angle_difference(apd,d))<45||pm {
				nd+=90*multiplier;
				h=true
				if pm nd-=45*multiplier;
			}
		}
	} if h&&abs(angle_difference(d,nd))>90 {
		nx=lengthdir_x(1,round(nd mod 360));
		ny=lengthdir_y(1,round(nd mod 360));
	}
}

var mx=ix-nx*dot_product(ix,iy,nx,ny);
var my=iy-ny*dot_product(ix,iy,nx,ny);
var rmx=round(mx*8)/8;
var rmy=round(my*8)/8;

if n {
	if mx!=0||my!=0 {
		var mm=point_distance(0,0,mx,my);
		var nmx=(mx/mm)*m;
		var nmy=(my/mm)*m;
		rmx=round(nmx*8)/8;
		rmy=round(nmy*8)/8;
	}
}

if lmx!=rmx||lmy!=rmy {
	ssmx=0;ssmy=0;
} lmx=rmx;lmy=rmy;
ssmx+=rmx;
ssmy+=rmy;
var smx=ssmx div 1;
var smy=ssmy div 1;
ssmx-=smx;
ssmy-=smy;

x+=smx;
y+=smy;

if place_meeting(x,y,c) {
	var nsm=point_distance(0,0,smx,smy);
	var nsmx=smx/nsm,nsmy=smy/nsm;
	var rx=round(x),ry=round(y);
	while place_meeting(rx,ry,c) {
		x-=nsmx;
		y-=nsmy;
		rx=round(x);
		ry=round(y);
	}x=rx;y=ry;
}