function p_abc(a,b){
	
	var c = (a-b)%3;
	
	if(c<=0) c=c+3;	
	
	return c;
}

function p_two(a){
	
	var b = a;
	if(a.length==1){
		b = "0"+a;
	}
	console.log("b: "+b);
	return b;
}