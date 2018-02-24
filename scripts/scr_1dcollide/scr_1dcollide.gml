var body1 = argument0
var body2 = argument1

var ma = (body1.mass + body2.mass);
var mb = (body1.mass - body2.mass);
var mc = 2 * body2.mass

var retval;
retval[0] = (body1.hspd * mb + body2.hspd * mc) / ma;
retval[1] = (body1.vspd * mb + body2.vspd * mc) / ma;

return retval;