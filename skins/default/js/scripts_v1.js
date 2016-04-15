function hideShow(id) {
	x= document.getElementById(id);
	
	if(x.style.display == 'block') {
		x.style.display = 'none';
	} else {
		x.style.display = 'block';
	}
}

x = 0;
function test() {
	++x;
	console.log('это функция test '+x);
	if(x == 5) {
		clearInterval(intervalId);
	}
}