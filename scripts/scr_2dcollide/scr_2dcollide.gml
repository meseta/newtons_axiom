// from: http://williamecraver.wixsite.com/elastic-equations
var body1 = argument0
var body2 = argument1

var retval;
	
if(body1.mass == 0) {	
	retval[0] = 0;
	retval[1] = 0;
	return retval;
}


var v1 = point_distance(0, 0, body1.hspd, body1.vspd);
var t1 = -point_direction(0, 0, body1.hspd, body1.vspd);
var m1 = body1.mass

var p = -point_direction(body1.x, body1.y, body2.x, body2.y);

var dcp = dcos(p);
var dsp = dsin(p);

if(body2.mass == 0) {
	var a = -v1*dcos(t1-p);
}
else {
	var v2 = point_distance(0, 0, body2.hspd, body2.vspd);
	var t2 = -point_direction(0, 0, body2.hspd, body2.vspd);
	var m2 = body2.mass
	
	var a = (v1*dcos(t1-p)*(m1-m2)+2*m2*v2*dcos(t2-p))/(m1+m2);
}

var b = v1*dsin(t1-p);

retval[0] = a*dcp - b*dsp;
retval[1] = a*dsp + b*dcp;
return retval;